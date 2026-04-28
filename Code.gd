
/**
 * Shanti Ki Aur - Backend Code
 * Purpose: Handle form submissions, security, and data storage.
 */

function doGet() {
  return HtmlService.createHtmlOutputFromFile('INDEX')
      .setTitle('शांति की ओर - मिशन पोर्टल')
      .setXFrameOptionsMode(HtmlService.XFrameOptionsMode.ALLOWALL)
      .addMetaTag('viewport', 'width=device-width, initial-scale=1');
}

function processForm(obj) {
  try {
    var ss = SpreadsheetApp.getActiveSpreadsheet();
    var sheet = ss.getSheets()[0];
    var data = sheet.getDataRange().getValues();
    var mobile = obj.mobile.trim();
    
    // सुरक्षा: ब्लॉक चेक
    for (var i = 1; i < data.length; i++) {
      if (data[i][2].toString().indexOf(mobile) !== -1 && data[i][9] === "BLOCK") {
        return "सुरक्षा कारणों से इस नंबर को ब्लॉक किया गया है।";
      }
    }

    var refNumber = "";
    var isExisting = false;
    for (var i = 1; i < data.length; i++) {
      if (data[i][2].toString().indexOf(mobile) !== -1) {
        refNumber = data[i][1];
        isExisting = true;
        break;
      }
    }

    if (!isExisting) {
      var nextID = sheet.getLastRow();
      refNumber = (nextID < 10 ? "0" + nextID : nextID) + "SHANTI";
    }

    var fileUrl = "No File";
    if (obj.file) {
      var blob = Utilities.newBlob(Utilities.base64Decode(obj.file.data), obj.file.mimeType, obj.file.fileName);
      var file = DriveApp.createFile(blob);
      file.setSharing(DriveApp.Access.ANYONE_WITH_LINK, DriveApp.Permission.VIEW);
      fileUrl = file.getUrl();
    }

    sheet.appendRow([new Date(), refNumber, "'" + mobile, obj.name, obj.state, obj.message, fileUrl, "Pending", "", "ACTIVE", ""]);
    return "सफलतापूर्वक भेजा गया! आपकी आईडी: " + refNumber;
  } catch (e) { return "त्रुटि: " + e.toString(); }
}

function checkStatus(id) {
  var ss = SpreadsheetApp.getActiveSpreadsheet();
  var sheet = ss.getSheets()[0];
  var data = sheet.getDataRange().getValues();
  var html = "";
  var found = false;
  var now = new Date();

  for (var i = 1; i < data.length; i++) {
    if (data[i][1].toString() === id || data[i][2].toString().indexOf(id) !== -1) {
      if(data[i][9] === "BLOCK") return "एक्सेस ब्लॉक है।";
      var firstViewStr = data[i][10];
      if (!firstViewStr) {
        sheet.getRange(i + 1, 11).setValue(now);
      } else {
        if ((now - new Date(firstViewStr)) / (1000 * 60 * 60) > 24) continue;
      }
      found = true;
      html += "<div style='background:#f9f9f9; padding:15px; margin-bottom:12px; border-radius:10px; border-left:5px solid #800000;'>";
      html += "<b>आपका संदेश:</b> " + data[i][5];
      if(data[i][8]) html += "<br><div style='color:#800000; margin-top:10px;'><b>जवाब:</b> " + data[i][8] + "</div>";
      html += "</div>";
    }
  }
  return found ? "<h3>पिछली बातचीत:</h3>" + html : "<h3>कोई रिकॉर्ड नहीं मिला।</h3>";
}
