// New question "NO DATA" checkbox handelers
// Bovine form validation
function changecowrace() {
  var crace = document.getElementById('cowrace');
  var cracecheck = document.getElementById('cowracec');
  if (cracecheck.checked) {
    crace.value="Sin datos";
    $('#cowrace').prop("readonly", true);
  }
  else {
    crace.value="";
    $('#cowrace').prop("readonly", false);
  }
}
function changecowage() {
  var cage = document.getElementById('cowage');
  var cagecheck = document.getElementById('cowagec');
  if (cagecheck.checked) {
    cage.value="0000";
    $('#cowage').prop("readonly", true);
    $('#cowday').prop("disabled", true);
    $('#cowmonth').prop("disabled", true);
    $('#cowyear').prop("disabled", true);
  }
  else {
    cage.value="";
    $('#cowage').prop("readonly", false);
    $('#cowday').prop("disabled", false);
    $('#cowmonth').prop("disabled", false);
    $('#cowyear').prop("disabled", false);
  }
}
function changecowweight() {
  var cweight = document.getElementById('cowweight');
  var cweightcheck = document.getElementById('cowweightc');
  if (cweightcheck.checked) {
    cweight.value="0000";
    $('#cowweight').prop("readonly", true);
  }
  else {
    cweight.value="";
    $('#cowweight').prop("readonly", false);
  }
}
function changecowheart() {
  var cheart = document.getElementById('cowheart');
  var cheartcheck = document.getElementById('cowheartc');
  if (cheartcheck.checked) {
    cheart.value="0000";
    $('#cowheart').prop("readonly", true);
  }
  else {
    cheart.value="";
    $('#cowheart').prop("readonly", false);
  }
}
function changecowresp() {
  var cresp = document.getElementById('cowresp');
  var crespcheck = document.getElementById('cowrespc');
  if (crespcheck.checked) {
    cresp.value="0000";
    $('#cowresp').prop("readonly", true);
  }
  else {
    cresp.value="";
    $('#cowresp').prop("readonly", false);
  }
}
function changecowtemp() {
  var ctemp = document.getElementById('cowtemp');
  var ctempcheck = document.getElementById('cowtempc');
  if (ctempcheck.checked) {
    ctemp.value="0000";
    $('#cowtemp').prop("readonly", true);
  }
  else {
    ctemp.value="";
    $('#cowtemp').prop("readonly", false);
  }
}
function changecowcap() {
  var ccap = document.getElementById('cowcapilar');
  var ccapcheck = document.getElementById('cowcapc');
  if (ccapcheck.checked) {
    ccap.value="0000";
    $('#cowcapilar').prop("readonly", true);
  }
  else {
    ccap.value="";
    $('#cowcapilar').prop("readonly", false);
  }
}
function changecowmucos() {
  var cmucos = document.getElementById('cowmucosal');
  var cmucoscheck = document.getElementById('cowmucoc');
  if (cmucoscheck.checked) {
    cmucos.value="Sin datos";
    $('#cowmucosal').prop("readonly", true);
  }
  else {
    cmucos.value="";
    $('#cowmucosal').prop("readonly", false);
  }
}
function changecowlymph() {
  var clymph = document.getElementById('cowlymph');
  var clymphcheck = document.getElementById('cowlymphc');
  if (clymphcheck.checked) {
    clymph.value="Sin datos";
    $('#cowlymph').prop("readonly", true);
  }
  else {
    clymph.value="";
    $('#cowlymph').prop("readonly", false);
  }
}
function changecowruminal() {
  var crumnial = document.getElementById('cowruminal');
  var crumnialcheck = document.getElementById('cowrumic');
  if (crumnialcheck.checked) {
    crumnial.value="Sin datos";
    $('#cowruminal').prop("readonly", true);
  }
  else {
    crumnial.value="";
    $('#cowruminal').prop("readonly", false);
  }
}
function changecowcondition() {
  var ccond = document.getElementById('cowcondition');
  var ccondcheck = document.getElementById('cowcondc');
  if (ccondcheck.checked) {
    ccond.value="Sin datos";
    $('#cowcondition').prop("readonly", true);
  }
  else {
    ccond.value="";
    $('#cowcondition').prop("readonly", false);
  }
}



// Porcine form validation
function porchangerace() {
  var prace = document.getElementById('porrace');
  var pracecheck = document.getElementById('porracec');
  if (pracecheck.checked) {
    prace.value="Sin datos";
    $('#porrace').prop("readonly", true);
  }
  else {
    prace.value="";
    $('#porrace').prop("readonly", false);
  }
}
function porchangeage() {
  var page = document.getElementById('porage');
  var pagecheck = document.getElementById('poragec');
  if (pagecheck.checked) {
    page.value="0000";
    $('#porage').prop("readonly", true);
    $('#porday').prop("disabled", true);
    $('#pormonth').prop("disabled", true);
    $('#poryear').prop("disabled", true);
  }
  else {
    page.value="";
    $('#porage').prop("readonly", false);
    $('#porday').prop("disabled", false);
    $('#pormonth').prop("disabled", false);
    $('#poryear').prop("disabled", false);
  }
}
function porchangeweight() {
  var pweight = document.getElementById('porweight');
  var pweightcheck = document.getElementById('porweightc');
  if (pweightcheck.checked) {
    pweight.value="0000";
    $('#porweight').prop("readonly", true);
  }
  else {
    pweight.value="";
    $('#porweight').prop("readonly", false);
  }
}
function porchangephysio() {
  var pheart = document.getElementById('porphysio');
  var pheartcheck = document.getElementById('porphysioc');
  if (pheartcheck.checked) {
    pheart.value="Sin datos";
    $('#porphysio').prop("readonly", true);
  }
  else {
    pheart.value="";
    $('#porphysio').prop("readonly", false);
  }
}
function porchangeprod() {
  var pheart = document.getElementById('porprod');
  var pheartcheck = document.getElementById('porprodc');
  if (pheartcheck.checked) {
    pheart.value="Sin datos";
    $('#porprod').prop("readonly", true);
  }
  else {
    pheart.value="";
    $('#porprod').prop("readonly", false);
  }
}
function porchangecurse() {
  var pheart = document.getElementById('porcurse');
  var pheartcheck = document.getElementById('porcursec');
  if (pheartcheck.checked) {
    pheart.value="Sin datos";
    $('#porcurse').prop("readonly", true);
  }
  else {
    pheart.value="";
    $('#porcurse').prop("readonly", false);
  }
}
function porchangeheart() {
  var pheart = document.getElementById('porheart');
  var pheartcheck = document.getElementById('porheartc');
  if (pheartcheck.checked) {
    pheart.value="0000";
    $('#porheart').prop("readonly", true);
  }
  else {
    pheart.value="";
    $('#porheart').prop("readonly", false);
  }
}
function porchangeresp() {
  var presp = document.getElementById('porresp');
  var prespcheck = document.getElementById('porrespc');
  if (prespcheck.checked) {
    presp.value="0000";
    $('#porresp').prop("readonly", true);
  }
  else {
    presp.value="";
    $('#porresp').prop("readonly", false);
  }
}
function porchangetemp() {
  var ptemp = document.getElementById('portemp');
  var ptempcheck = document.getElementById('portempc');
  if (ptempcheck.checked) {
    ptemp.value="0000";
    $('#portemp').prop("readonly", true);
  }
  else {
    ptemp.value="";
    $('#portemp').prop("readonly", false);
  }
}
function porchangecolor() {
  var pcap = document.getElementById('porcolor');
  var pcapcheck = document.getElementById('porcolorc');
  if (pcapcheck.checked) {
    pcap.value="Sin datos";
    $('#porcolor').prop("readonly", true);
  }
  else {
    pcap.value="";
    $('#porcolor').prop("readonly", false);
  }
}
function porchangeatt() {
  var pmucos = document.getElementById('poratt');
  var pmucoscheck = document.getElementById('porattc');
  if (pmucoscheck.checked) {
    pmucos.value="Sin datos";
    $('#poratt').prop("readonly", true);
  }
  else {
    pmucos.value="";
    $('#poratt').prop("readonly", false);
  }
}
function porchangecond() {
  var plymph = document.getElementById('porcondition');
  var plymphcheck = document.getElementById('porcondc');
  if (plymphcheck.checked) {
    plymph.value="Sin datos";
    $('#porcondition').prop("readonly", true);
  }
  else {
    plymph.value="";
    $('#porcondition').prop("readonly", false);
  }
}



// Horse form validation
function changehorserace() {
  var hrrace = document.getElementById('horrace');
  var hrracecheck = document.getElementById('horracec');
  if (hrracecheck.checked) {
    hrrace.value="Sin datos";
    $('#horrace').prop("readonly", true);
  }
  else {
    hrrace.value="";
    $('#horrace').prop("readonly", false);
  }
}
function changehorseage() {
  var hrage = document.getElementById('horage');
  var hragecheck = document.getElementById('horagec');
  if (hragecheck.checked) {
    hrage.value="0000";
    $('#horage').prop("readonly", true);
    $('#horseday').prop("disabled", true);
    $('#horsemonth').prop("disabled", true);
    $('#horseyear').prop("disabled", true);
  }
  else {
    hrage.value="";
    $('#horage').prop("readonly", false);
    $('#horseday').prop("disabled", false);
    $('#horsemonth').prop("disabled", false);
    $('#horseyear').prop("disabled", false);
  }
}
function changehorseweight() {
  var hrweight = document.getElementById('horweight');
  var hrweightcheck = document.getElementById('horweightc');
  if (hrweightcheck.checked) {
    hrweight.value="0000";
    $('#horweight').prop("readonly", true);
  }
  else {
    hrweight.value="";
    $('#horweight').prop("readonly", false);
  }
}
function changehorseheart() {
  var hrheart = document.getElementById('horheart');
  var hrheartcheck = document.getElementById('horheartc');
  if (hrheartcheck.checked) {
    hrheart.value="0000";
    $('#horheart').prop("readonly", true);
  }
  else {
    hrheart.value="";
    $('#horheart').prop("readonly", false);
  }
}
function changehorseresp() {
  var hrresp = document.getElementById('horresp');
  var hrrespcheck = document.getElementById('horrespc');
  if (hrrespcheck.checked) {
    hrresp.value="0000";
    $('#horresp').prop("readonly", true);
  }
  else {
    hrresp.value="";
    $('#horresp').prop("readonly", false);
  }
}
function changehorsetemp() {
  var hrtemp = document.getElementById('hortemp');
  var hrtempcheck = document.getElementById('hortempc');
  if (hrtempcheck.checked) {
    hrtemp.value="0000";
    $('#hortemp').prop("readonly", true);
  }
  else {
    hrtemp.value="";
    $('#hortemp').prop("readonly", false);
  }
}
function changehorsecap() {
  var hrcap = document.getElementById('horcapilar');
  var hrcapcheck = document.getElementById('horcapc');
  if (hrcapcheck.checked) {
    hrcap.value="0000";
    $('#horcapilar').prop("readonly", true);
  }
  else {
    hrcap.value="";
    $('#horcapilar').prop("readonly", false);
  }
}
function changehorsemucos() {
  var hrmucos = document.getElementById('hormucosal');
  var hrmucoscheck = document.getElementById('hormucoc');
  if (hrmucoscheck.checked) {
    hrmucos.value="Sin datos";
    $('#hormucosal').prop("readonly", true);
  }
  else {
    hrmucos.value="";
    $('#hormucosal').prop("readonly", false);
  }
}
function changehorselymph() {
  var hrlymph = document.getElementById('horlymph');
  var hrlymphcheck = document.getElementById('horlymphc');
  if (hrlymphcheck.checked) {
    hrlymph.value="Sin datos";
    $('#horlymph').prop("readonly", true);
  }
  else {
    hrlymph.value="";
    $('#horlymph').prop("readonly", false);
  }
}
function changehorsecondition() {
  var hrage = document.getElementById('horcondition');
  var hragecheck = document.getElementById('horcondc');
  if (hragecheck.checked) {
    hrage.value="Sin datos";
    $('#horcondition').prop("readonly", true);
  }
  else {
    hrage.value="";
    $('#horcondition').prop("readonly", false);
  }
}



// Ovine form validation
function ovichangerace() {
  var prace = document.getElementById('ovirace');
  var pracecheck = document.getElementById('oviracec');
  if (pracecheck.checked) {
    prace.value="Sin datos";
    $('#ovirace').prop("readonly", true);
  }
  else {
    prace.value="";
    $('#ovirace').prop("readonly", false);
  }
}
function ovichangeage() {
  var page = document.getElementById('oviage');
  var pagecheck = document.getElementById('oviagec');
  if (pagecheck.checked) {
    page.value="0000";
    $('#oviage').prop("readonly", true);
    $('#oviday').prop("disabled", true);
    $('#ovimonth').prop("disabled", true);
    $('#oviyear').prop("disabled", true);
  }
  else {
    page.value="";
    $('#oviage').prop("readonly", false);
    $('#oviday').prop("disabled", false);
    $('#ovimonth').prop("disabled", false);
    $('#oviyear').prop("disabled", false);
  }
}
function ovichangeweight() {
  var pweight = document.getElementById('oviweight');
  var pweightcheck = document.getElementById('oviweightc');
  if (pweightcheck.checked) {
    pweight.value="0000";
    $('#oviweight').prop("readonly", true);
  }
  else {
    pweight.value="";
    $('#oviweight').prop("readonly", false);
  }
}
function ovichangephysio() {
  var pheart = document.getElementById('oviphysio');
  var pheartcheck = document.getElementById('oviphysioc');
  if (pheartcheck.checked) {
    pheart.value="Sin datos";
    $('#oviphysio').prop("readonly", true);
  }
  else {
    pheart.value="";
    $('#oviphysio').prop("readonly", false);
  }
}
function ovichangeprod() {
  var pheart = document.getElementById('oviprod');
  var pheartcheck = document.getElementById('oviprodc');
  if (pheartcheck.checked) {
    pheart.value="Sin datos";
    $('#oviprod').prop("readonly", true);
  }
  else {
    pheart.value="";
    $('#oviprod').prop("readonly", false);
  }
}
function ovichangezoo() {
  var pheart = document.getElementById('ovizoo');
  var pheartcheck = document.getElementById('ovizooc');
  if (pheartcheck.checked) {
    pheart.value="Sin datos";
    $('#ovizoo').prop("readonly", true);
  }
  else {
    pheart.value="";
    $('#ovizoo').prop("readonly", false);
  }
}
function ovichangeheart() {
  var pheart = document.getElementById('oviheart');
  var pheartcheck = document.getElementById('oviheartc');
  if (pheartcheck.checked) {
    pheart.value="0000";
    $('#oviheart').prop("readonly", true);
  }
  else {
    pheart.value="";
    $('#oviheart').prop("readonly", false);
  }
}
function ovichangeresp() {
  var presp = document.getElementById('oviresp');
  var prespcheck = document.getElementById('ovirespc');
  if (prespcheck.checked) {
    presp.value="0000";
    $('#oviresp').prop("readonly", true);
  }
  else {
    presp.value="";
    $('#oviresp').prop("readonly", false);
  }
}
function ovichangetemp() {
  var ptemp = document.getElementById('ovitemp');
  var ptempcheck = document.getElementById('ovitempc');
  if (ptempcheck.checked) {
    ptemp.value="0000";
    $('#ovitemp').prop("readonly", true);
  }
  else {
    ptemp.value="";
    $('#ovitemp').prop("readonly", false);
  }
}
function ovichangemucos() {
  var pcap = document.getElementById('ovimucos');
  var pcapcheck = document.getElementById('ovimucosc');
  if (pcapcheck.checked) {
    pcap.value="Sin datos";
    $('#ovimucos').prop("readonly", true);
  }
  else {
    pcap.value="";
    $('#ovimucos').prop("readonly", false);
  }
}
function ovichangelymph() {
  var pmucos = document.getElementById('ovilymph');
  var pmucoscheck = document.getElementById('ovilymphc');
  if (pmucoscheck.checked) {
    pmucos.value="Sin datos";
    $('#ovilymph').prop("readonly", true);
  }
  else {
    pmucos.value="";
    $('#ovilymph').prop("readonly", false);
  }
}
function ovichangeruminal() {
  var pmucos = document.getElementById('oviruminal');
  var pmucoscheck = document.getElementById('oviruminalc');
  if (pmucoscheck.checked) {
    pmucos.value="Sin datos";
    $('#oviruminal').prop("readonly", true);
  }
  else {
    pmucos.value="";
    $('#oviruminal').prop("readonly", false);
  }
}
function ovichangecond() {
  var plymph = document.getElementById('ovicondition');
  var plymphcheck = document.getElementById('ovicondc');
  if (plymphcheck.checked) {
    plymph.value="Sin datos";
    $('#ovicondition').prop("readonly", true);
  }
  else {
    plymph.value="";
    $('#ovicondition').prop("readonly", false);
  }
}



// Goat form validation
function goatchangerace() {
  var prace = document.getElementById('goatrace');
  var pracecheck = document.getElementById('goatracec');
  if (pracecheck.checked) {
    prace.value="Sin datos";
    $('#goatrace').prop("readonly", true);
  }
  else {
    prace.value="";
    $('#goatrace').prop("readonly", false);
  }
}
function goatchangeage() {
  var page = document.getElementById('goatage');
  var pagecheck = document.getElementById('goatagec');
  if (pagecheck.checked) {
    page.value="0000";
    $('#goatage').prop("readonly", true);
    $('#goatday').prop("disabled", true);
    $('#goatmonth').prop("disabled", true);
    $('#goatyear').prop("disabled", true);
  }
  else {
    page.value="";
    $('#goatage').prop("readonly", false);
    $('#goatday').prop("disabled", false);
    $('#goatmonth').prop("disabled", false);
    $('#goatyear').prop("disabled", false);
  }
}
function goatchangeweight() {
  var pweight = document.getElementById('goatweight');
  var pweightcheck = document.getElementById('goatweightc');
  if (pweightcheck.checked) {
    pweight.value="0000";
    $('#goatweight').prop("readonly", true);
  }
  else {
    pweight.value="";
    $('#goatweight').prop("readonly", false);
  }
}
function goatchangephysio() {
  var pheart = document.getElementById('goatphysio');
  var pheartcheck = document.getElementById('goatphysioc');
  if (pheartcheck.checked) {
    pheart.value="Sin datos";
    $('#goatphysio').prop("readonly", true);
  }
  else {
    pheart.value="";
    $('#goatphysio').prop("readonly", false);
  }
}
function goatchangeprod() {
  var pheart = document.getElementById('goatprod');
  var pheartcheck = document.getElementById('goatprodc');
  if (pheartcheck.checked) {
    pheart.value="Sin datos";
    $('#goatprod').prop("readonly", true);
  }
  else {
    pheart.value="";
    $('#goatprod').prop("readonly", false);
  }
}
function goatchangezoo() {
  var pheart = document.getElementById('goatzoo');
  var pheartcheck = document.getElementById('goatzooc');
  if (pheartcheck.checked) {
    pheart.value="Sin datos";
    $('#goatzoo').prop("readonly", true);
  }
  else {
    pheart.value="";
    $('#goatzoo').prop("readonly", false);
  }
}
function goatchangeheart() {
  var pheart = document.getElementById('goatheart');
  var pheartcheck = document.getElementById('goatheartc');
  if (pheartcheck.checked) {
    pheart.value="0000";
    $('#goatheart').prop("readonly", true);
  }
  else {
    pheart.value="";
    $('#goatheart').prop("readonly", false);
  }
}
function goatchangeresp() {
  var presp = document.getElementById('goatresp');
  var prespcheck = document.getElementById('goatrespc');
  if (prespcheck.checked) {
    presp.value="0000";
    $('#goatresp').prop("readonly", true);
  }
  else {
    presp.value="";
    $('#goatresp').prop("readonly", false);
  }
}
function goatchangetemp() {
  var ptemp = document.getElementById('goattemp');
  var ptempcheck = document.getElementById('goattempc');
  if (ptempcheck.checked) {
    ptemp.value="0000";
    $('#goattemp').prop("readonly", true);
  }
  else {
    ptemp.value="";
    $('#goattemp').prop("readonly", false);
  }
}
function goatchangecapilar() {
  var pcap = document.getElementById('goatcapilar');
  var pcapcheck = document.getElementById('goatcapilarc');
  if (pcapcheck.checked) {
    pcap.value="0000";
    $('#goatcapilar').prop("readonly", true);
  }
  else {
    pcap.value="";
    $('#goatcapilar').prop("readonly", false);
  }
}
function goatchangemucos() {
  var pcap = document.getElementById('goatmucos');
  var pcapcheck = document.getElementById('goatmucosc');
  if (pcapcheck.checked) {
    pcap.value="Sin datos";
    $('#goatmucos').prop("readonly", true);
  }
  else {
    pcap.value="";
    $('#goatmucos').prop("readonly", false);
  }
}
function goatchangelymph() {
  var pmucos = document.getElementById('goatlymph');
  var pmucoscheck = document.getElementById('goatlymphc');
  if (pmucoscheck.checked) {
    pmucos.value="Sin datos";
    $('#goatlymph').prop("readonly", true);
  }
  else {
    pmucos.value="";
    $('#goatlymph').prop("readonly", false);
  }
}
function goatchangeruminal() {
  var pmucos = document.getElementById('goatruminal');
  var pmucoscheck = document.getElementById('goatruminalc');
  if (pmucoscheck.checked) {
    pmucos.value="Sin datos";
    $('#goatruminal').prop("readonly", true);
  }
  else {
    pmucos.value="";
    $('#goatruminal').prop("readonly", false);
  }
}
function goatchangecough() {
  var pmucos = document.getElementById('goatcough');
  var pmucoscheck = document.getElementById('goatcoughc');
  if (pmucoscheck.checked) {
    pmucos.value="Sin datos";
    $('#goatcough').prop("readonly", true);
  }
  else {
    pmucos.value="";
    $('#goatcough').prop("readonly", false);
  }
}
function goatchangecond() {
  var plymph = document.getElementById('goatcondition');
  var plymphcheck = document.getElementById('goatcondc');
  if (plymphcheck.checked) {
    plymph.value="Sin datos";
    $('#goatcondition').prop("readonly", true);
  }
  else {
    plymph.value="";
    $('#goatcondition').prop("readonly", false);
  }
}



// Rabbit form validation
function rabchangerace() {
  var prace = document.getElementById('rabrace');
  var pracecheck = document.getElementById('rabracec');
  if (pracecheck.checked) {
    prace.value="Sin datos";
    $('#rabrace').prop("readonly", true);
  }
  else {
    prace.value="";
    $('#rabrace').prop("readonly", false);
  }
}
function rabchangeage() {
  var page = document.getElementById('rabage');
  var pagecheck = document.getElementById('rabagec');
  if (pagecheck.checked) {
    page.value="0000";
    $('#rabage').prop("readonly", true);
    $('#rabday').prop("disabled", true);
    $('#rabmonth').prop("disabled", true);
    $('#rabyear').prop("disabled", true);
  }
  else {
    page.value="";
    $('#rabage').prop("readonly", false);
    $('#rabday').prop("disabled", false);
    $('#rabmonth').prop("disabled", false);
    $('#rabyear').prop("disabled", false);
  }
}
function rabchangeweight() {
  var pweight = document.getElementById('rabweight');
  var pweightcheck = document.getElementById('rabweightc');
  if (pweightcheck.checked) {
    pweight.value="0000";
    $('#rabweight').prop("readonly", true);
  }
  else {
    pweight.value="";
    $('#rabweight').prop("readonly", false);
  }
}
function rabchangeheart() {
  var pheart = document.getElementById('rabheart');
  var pheartcheck = document.getElementById('rabheartc');
  if (pheartcheck.checked) {
    pheart.value="0000";
    $('#rabheart').prop("readonly", true);
  }
  else {
    pheart.value="";
    $('#rabheart').prop("readonly", false);
  }
}
function rabchangeresp() {
  var presp = document.getElementById('rabresp');
  var prespcheck = document.getElementById('rabrespc');
  if (prespcheck.checked) {
    presp.value="0000";
    $('#rabresp').prop("readonly", true);
  }
  else {
    presp.value="";
    $('#rabresp').prop("readonly", false);
  }
}
function rabchangetemp() {
  var ptemp = document.getElementById('rabtemp');
  var ptempcheck = document.getElementById('rabtempc');
  if (ptempcheck.checked) {
    ptemp.value="0000";
    $('#rabtemp').prop("readonly", true);
  }
  else {
    ptemp.value="";
    $('#rabtemp').prop("readonly", false);
  }
}
function rabchangecapilar() {
  var pcap = document.getElementById('rabcapilar');
  var pcapcheck = document.getElementById('rabcapilarc');
  if (pcapcheck.checked) {
    pcap.value="0000";
    $('#rabcapilar').prop("readonly", true);
  }
  else {
    pcap.value="";
    $('#rabcapilar').prop("readonly", false);
  }
}
function rabchangemucos() {
  var pcap = document.getElementById('rabmucos');
  var pcapcheck = document.getElementById('rabmucosc');
  if (pcapcheck.checked) {
    pcap.value="Sin datos";
    $('#rabmucos').prop("readonly", true);
  }
  else {
    pcap.value="";
    $('#rabmucos').prop("readonly", false);
  }
}
function rabchangelymph() {
  var pmucos = document.getElementById('rablymph');
  var pmucoscheck = document.getElementById('rablymphc');
  if (pmucoscheck.checked) {
    pmucos.value="Sin datos";
    $('#rablymph').prop("readonly", true);
  }
  else {
    pmucos.value="";
    $('#rablymph').prop("readonly", false);
  }
}
function rabchangedehy() {
  var pmucos = document.getElementById('rabdehy');
  var pmucoscheck = document.getElementById('rabdehyc');
  if (pmucoscheck.checked) {
    pmucos.value="Sin datos";
    $('#rabdehy').prop("readonly", true);
  }
  else {
    pmucos.value="";
    $('#rabdehy').prop("readonly", false);
  }
}
function rabchangecond() {
  var plymph = document.getElementById('rabcondition');
  var plymphcheck = document.getElementById('rabcondc');
  if (plymphcheck.checked) {
    plymph.value="Sin datos";
    $('#rabcondition').prop("readonly", true);
  }
  else {
    plymph.value="";
    $('#rabcondition').prop("readonly", false);
  }
}



// Birds  form validation
function birdchangetype() {
  var ptype = document.getElementById('birdtype');
  var ptypecheck = document.getElementById('birdtypec');
  if (ptypecheck.checked) {
    ptype.value="Sin datos";
    $('#birdtype').prop("readonly", true);
  }
  else {
    ptype.value="";
    $('#birdtype').prop("readonly", false);
  }
}
function birdchangezoo() {
  var pzoo = document.getElementById('birdzoo');
  var pzoocheck = document.getElementById('birdzooc');
  if (pzoocheck.checked) {
    pzoo.value="Sin datos";
    $('#birdzoo').prop("readonly", true);
  }
  else {
    pzoo.value="";
    $('#birdzoo').prop("readonly", false);
  }
}
function birdchangeagew() {
  var pagew = document.getElementById('birdagew');
  var pagewcheck = document.getElementById('birdagewc');
  if (pagewcheck.checked) {
    pagew.value="0000";
    $('#birdagew').prop("readonly", true);
  }
  else {
    pagew.value="";
    $('#birdagew').prop("readonly", false);
  }
}
function birdchangeagem() {
  var pagem = document.getElementById('birdagem');
  var pagemcheck = document.getElementById('birdagemc');
  if (pagemcheck.checked) {
    pagem.value="0000";
    $('#birdagem').prop("readonly", true);
  }
  else {
    pagem.value="";
    $('#birdagem').prop("readonly", false);
  }
}
function birdchangeplace() {
  var pplace = document.getElementById('birdplace');
  var pplacecheck = document.getElementById('birdplacec');
  if (pplacecheck.checked) {
    pplace.value="Sin datos";
    $('#birdplace').prop("readonly", true);
  }
  else {
    pplace.value="";
    $('#birdplace').prop("readonly", false);
  }
}
function birdchangequant() {
  var pquant = document.getElementById('birdquant');
  var pquantcheck = document.getElementById('birdquantc');
  if (pquantcheck.checked) {
    pquant.value="0000";
    $('#birdquant').prop("readonly", true);
  }
  else {
    pquant.value="";
    $('#birdquant').prop("readonly", false);
  }
}
function birdchangeexist() {
  var pexist = document.getElementById('birdexist');
  var pexistcheck = document.getElementById('birdexistc');
  if (pexistcheck.checked) {
    pexist.value="Sin datos";
    $('#birdexist').prop("readonly", true);
  }
  else {
    pexist.value="";
    $('#birdexist').prop("readonly", false);
  }
}
function birdchangeorigin() {
  var porigin = document.getElementById('birdorigin');
  var porigincheck = document.getElementById('birdoriginc');
  if (porigincheck.checked) {
    porigin.value="Sin datos";
    $('#birdorigin').prop("readonly", true);
  }
  else {
    porigin.value="";
    $('#birdorigin').prop("readonly", false);
  }
}
function birdchangemorb() {
  var pmorb = document.getElementById('birdmorb');
  var pmorbcheck = document.getElementById('birdmorbc');
  if (pmorbcheck.checked) {
    pmorb.value="0000";
    $('#birdmorb').prop("readonly", true);
  }
  else {
    pmorb.value="";
    $('#birdmorb').prop("readonly", false);
  }
}
function birdchangemort() {
  var pmort = document.getElementById('birdmort');
  var pmortcheck = document.getElementById('birdmortc');
  if (pmortcheck.checked) {
    pmort.value="0000";
    $('#birdmort').prop("readonly", true);
  }
  else {
    pmort.value="";
    $('#birdmort').prop("readonly", false);
  }
}
function birdchangedate() {
  var pdate = document.getElementById('birddate');
  var pdatecheck = document.getElementById('birddatec');
  if (pdatecheck.checked) {
    pdate.value="0000";
    $('#birddate').prop("readonly", true);
  }
  else {
    pdate.value="";
    $('#birddate').prop("readonly", false);
  }
}
function birdchangewater() {
  var pwater = document.getElementById('birdwater');
  var pwatercheck = document.getElementById('birdwaterc');
  if (pwatercheck.checked) {
    pwater.value="Sin datos";
    $('#birdwater').prop("readonly", true);
  }
  else {
    pwater.value="";
    $('#birdwater').prop("readonly", false);
  }
}
function birdchangeeat() {
  var peat = document.getElementById('birdeat');
  var peatcheck = document.getElementById('birdeatc');
  if (peatcheck.checked) {
    peat.value="Sin datos";
    $('#birdeat').prop("readonly", true);
  }
  else {
    pwater.value="";
    $('#birdeat').prop("readonly", false);
  }
}
function birdchangevaccine() {
  var pvaccine = document.getElementById('birdvaccine');
  var pvaccinecheck = document.getElementById('birdvaccinec');
  if (pvaccinecheck.checked) {
    pvaccine.value="Sin datos";
    $('#birdvaccine').prop("readonly", true);
  }
  else {
    pvaccine.value="";
    $('#birdvaccine').prop("readonly", false);
  }
}
function birdchangedefec() {
  var pdefec = document.getElementById('birddefec');
  var pdefeccheck = document.getElementById('birddefecc');
  if (pdefeccheck.checked) {
    pdefec.value="Sin datos";
    $('#birddefec').prop("readonly", true);
  }
  else {
    pdefec.value="";
    $('#birddefec').prop("readonly", false);
  }
}
function birdchangecondition() {
  var pcondition = document.getElementById('birdcondition');
  var pconditioncheck = document.getElementById('birdconditionc');
  if (pconditioncheck.checked) {
    pcondition.value="Sin datos";
    $('#birdcondition').prop("readonly", true);
  }
  else {
    pcondition.value="";
    $('#birdcondition').prop("readonly", false);
  }
}
function birdchangeplumage() {
  var pplumage = document.getElementById('birdplumage');
  var pplumagecheck = document.getElementById('birdplumagec');
  if (pplumagecheck.checked) {
    pplumage.value="Sin datos";
    $('#birdplumage').prop("readonly", true);
  }
  else {
    pplumage.value="";
    $('#birdplumage').prop("readonly", false);
  }
}
function birdchangelegs() {
  var plegs = document.getElementById('birdlegs');
  var plegscheck = document.getElementById('birdlegsc');
  if (plegscheck.checked) {
    plegs.value="Sin datos";
    $('#birdlegs').prop("readonly", true);
  }
  else {
    plegs.value="";
    $('#birdlegs').prop("readonly", false);
  }
}
function birdchangebreath() {
  var pbreath = document.getElementById('birdbreath');
  var pbreathcheck = document.getElementById('birdbreathc');
  if (pbreathcheck.checked) {
    pbreath.value="0000";
    $('#birdbreath').prop("readonly", true);
  }
  else {
    pbreath.value="";
    $('#birdbreath').prop("readonly", false);
  }
}
function birdchangedehy() {
  var pdehy = document.getElementById('birddehy');
  var pdehycheck = document.getElementById('birddehyc');
  if (pdehycheck.checked) {
    pdehy.value="Sin datos";
    $('#birddehy').prop("readonly", true);
  }
  else {
    pdehy.value="";
    $('#birddehy').prop("readonly", false);
  }
}
function birdchangeatt() {
  var patt = document.getElementById('birdatt');
  var pattcheck = document.getElementById('birdattc');
  if (pattcheck.checked) {
    patt.value="Sin datos";
    $('#birdatt').prop("readonly", true);
  }
  else {
    patt.value="";
    $('#birdatt').prop("readonly", false);
  }
}




// Dog form validation
function changedograce() {
  var hrrace = document.getElementById('dograce');
  var hrracecheck = document.getElementById('dogracec');
  if (hrracecheck.checked) {
    hrrace.value="Sin datos";
    $('#dograce').prop("readonly", true);
  }
  else {
    hrrace.value="";
    $('#dograce').prop("readonly", false);
  }
}
function changedogage() {
  var hrage = document.getElementById('dogage');
  var hragecheck = document.getElementById('dogagec');
  if (hragecheck.checked) {
    hrage.value="0000";
    $('#dogage').prop("readonly", true);
    $('#dogday').prop("disabled", true);
    $('#dogmonth').prop("disabled", true);
    $('#dogyear').prop("disabled", true);
  }
  else {
    hrage.value="";
    $('#dogage').prop("readonly", false);
    $('#dogday').prop("disabled", false);
    $('#dogmonth').prop("disabled", false);
    $('#dogyear').prop("disabled", false);
  }
}
function changedogweight() {
  var hrweight = document.getElementById('dogweight');
  var hrweightcheck = document.getElementById('dogweightc');
  if (hrweightcheck.checked) {
    hrweight.value="0000";
    $('#dogweight').prop("readonly", true);
  }
  else {
    hrweight.value="";
    $('#dogweight').prop("readonly", false);
  }
}
function changedogheart() {
  var hrheart = document.getElementById('dogheart');
  var hrheartcheck = document.getElementById('dogheartc');
  if (hrheartcheck.checked) {
    hrheart.value="0000";
    $('#dogheart').prop("readonly", true);
  }
  else {
    hrheart.value="";
    $('#dogheart').prop("readonly", false);
  }
}
function changedogresp() {
  var hrresp = document.getElementById('dogresp');
  var hrrespcheck = document.getElementById('dogrespc');
  if (hrrespcheck.checked) {
    hrresp.value="0000";
    $('#dogresp').prop("readonly", true);
  }
  else {
    hrresp.value="";
    $('#dogresp').prop("readonly", false);
  }
}
function changedogtemp() {
  var hrtemp = document.getElementById('dogtemp');
  var hrtempcheck = document.getElementById('dogtempc');
  if (hrtempcheck.checked) {
    hrtemp.value="0000";
    $('#dogtemp').prop("readonly", true);
  }
  else {
    hrtemp.value="";
    $('#dogtemp').prop("readonly", false);
  }
}
function changedogcap() {
  var hrcap = document.getElementById('dogcapilar');
  var hrcapcheck = document.getElementById('dogcapc');
  if (hrcapcheck.checked) {
    hrcap.value="0000";
    $('#dogcapilar').prop("readonly", true);
  }
  else {
    hrcap.value="";
    $('#dogcapilar').prop("readonly", false);
  }
}
function changedogmucos() {
  var hrmucos = document.getElementById('dogmucosal');
  var hrmucoscheck = document.getElementById('dogmucoc');
  if (hrmucoscheck.checked) {
    hrmucos.value="Sin datos";
    $('#dogmucosal').prop("readonly", true);
  }
  else {
    hrmucos.value="";
    $('#dogmucosal').prop("readonly", false);
  }
}
function changedogcough() {
  var hrcough = document.getElementById('dogcough');
  var hrcoughcheck = document.getElementById('dogcoughc');
  if (hrcoughcheck.checked) {
    hrcough.value="Sin datos";
    $('#dogcough').prop("readonly", true);
  }
  else {
    hrcough.value="";
    $('#dogcough').prop("readonly", false);
  }
}
function changedogpulse() {
  var hrage = document.getElementById('dogpulse');
  var hragecheck = document.getElementById('dogpulsec');
  if (hragecheck.checked) {
    hrage.value="Sin datos";
    $('#dogpulse').prop("readonly", true);
  }
  else {
    hrage.value="";
    $('#dogpulse').prop("readonly", false);
  }
}
function changedogskin() {
  var hrage = document.getElementById('dogskin');
  var hragecheck = document.getElementById('dogskinc');
  if (hragecheck.checked) {
    hrage.value="Sin datos";
    $('#dogskin').prop("readonly", true);
  }
  else {
    hrage.value="";
    $('#dogskin').prop("readonly", false);
  }
}



// Cat form validation
function changecatrace() {
  var catrace = document.getElementById('catrace');
  var catracecheck = document.getElementById('catracec');
  if (catracecheck.checked) {
    catrace.value="Sin datos";
    $('#catrace').prop("readonly", true);
  }
  else {
    catrace.value="";
    $('#catrace').prop("readonly", false);
  }
}
function changecatage() {
  var catage = document.getElementById('catage');
  var catagecheck = document.getElementById('catagec');
  if (catagecheck.checked) {
    catage.value="0000";
    $('#catage').prop("readonly", true);
    $('#catday').prop("disabled", true);
    $('#catmonth').prop("disabled", true);
    $('#catyear').prop("disabled", true);
  }
  else {
    catage.value="";
    $('#catage').prop("readonly", false);
    $('#catday').prop("disabled", false);
    $('#catmonth').prop("disabled", false);
    $('#catyear').prop("disabled", false);
  }
}
function changecatweight() {
  var catweight = document.getElementById('catweight');
  var catweightcheck = document.getElementById('catweightc');
  if (catweightcheck.checked) {
    catweight.value="0000";
    $('#catweight').prop("readonly", true);
  }
  else {
    catweight.value="";
    $('#catweight').prop("readonly", false);
  }
}
function changecatheart() {
  var catheart = document.getElementById('catheart');
  var catheartcheck = document.getElementById('catheartc');
  if (catheartcheck.checked) {
    catheart.value="0000";
    $('#catheart').prop("readonly", true);
  }
  else {
    catheart.value="";
    $('#catheart').prop("readonly", false);
  }
}
function changecatresp() {
  var catresp = document.getElementById('catresp');
  var catrespcheck = document.getElementById('catrespc');
  if (catrespcheck.checked) {
    catresp.value="0000";
    $('#catresp').prop("readonly", true);
  }
  else {
    catresp.value="";
    $('#catresp').prop("readonly", false);
  }
}
function changecattemp() {
  var cattemp = document.getElementById('cattemp');
  var cattempcheck = document.getElementById('cattempc');
  if (cattempcheck.checked) {
    cattemp.value="0000";
    $('#cattemp').prop("readonly", true);
  }
  else {
    cattemp.value="";
    $('#cattemp').prop("readonly", false);
  }
}
function changecatcap() {
  var catcap = document.getElementById('catcapilar');
  var catcapcheck = document.getElementById('catcapc');
  if (catcapcheck.checked) {
    catcap.value="0000";
    $('#catcapilar').prop("readonly", true);
  }
  else {
    catcap.value="";
    $('#catcapilar').prop("readonly", false);
  }
}
function changecatmucos() {
  var catmucos = document.getElementById('catmucosal');
  var catmucoscheck = document.getElementById('catmucoc');
  if (catmucoscheck.checked) {
    catmucos.value="Sin datos";
    $('#catmucosal').prop("readonly", true);
  }
  else {
    catmucos.value="";
    $('#catmucosal').prop("readonly", false);
  }
}
function changecatcough() {
  var catcough = document.getElementById('catcough');
  var catcoughcheck = document.getElementById('catcoughc');
  if (catcoughcheck.checked) {
    catcough.value="Sin datos";
    $('#catcough').prop("readonly", true);
  }
  else {
    catcough.value="";
    $('#catcough').prop("readonly", false);
  }
}
function changecatpulse() {
  var catage = document.getElementById('catpulse');
  var catagecheck = document.getElementById('catpulsec');
  if (catagecheck.checked) {
    catage.value="Sin datos";
    $('#catpulse').prop("readonly", true);
  }
  else {
    catage.value="";
    $('#catpulse').prop("readonly", false);
  }
}
function changecatskin() {
  var catage = document.getElementById('catskin');
  var catagecheck = document.getElementById('catskinc');
  if (catagecheck.checked) {
    catage.value="Sin datos";
    $('#catskin').prop("readonly", true);
  }
  else {
    catage.value="";
    $('#catskin').prop("readonly", false);
  }
}



// Wild life form validation
function changewildzoo() {
  var catzoo = document.getElementById('wildzoo');
  var wildzoocheck = document.getElementById('wildzooc');
  if (wildzoocheck.checked) {
    wildzoo.value="Sin datos";
    $('#wildzoo').prop("readonly", true);
  }
  else {
    wildzoo.value="";
    $('#wildzoo').prop("readonly", false);
  }
}
function changewildambiental() {
  var wildambiental = document.getElementById('wildambiental');
  var wildambientalcheck = document.getElementById('wildambientalc');
  if (wildambientalcheck.checked) {
    wildambiental.value="Sin datos";
    $('#wildambiental').prop("readonly", true);
  }
  else {
    wildambiental.value="";
    $('#wildambiental').prop("readonly", false);
  }
}
function changewildfeed() {
  var wildfeed = document.getElementById('wildfeed');
  var wildfeedcheck = document.getElementById('wildfeedc');
  if (wildfeedcheck.checked) {
    wildfeed.value="Sin datos";
    $('#wildfeed').prop("readonly", true);
  }
  else {
    wildfeed.value="";
    $('#wildfeed').prop("readonly", false);
  }
}
function changewildback() {
  var wildback = document.getElementById('wildback');
  var wildbackcheck = document.getElementById('wildbackc');
  if (wildbackcheck.checked) {
    wildback.value="Sin datos";
    $('#wildback').prop("readonly", true);
  }
  else {
    wildheart.value="";
    $('#wildback').prop("readonly", false);
  }
}
function changewildevol() {
  var wildevol = document.getElementById('wildevol');
  var wildevolcheck = document.getElementById('wildevolc');
  if (wildevolcheck.checked) {
    wildevol.value="Sin datos";
    $('#wildevol').prop("readonly", true);
  }
  else {
    wildevol.value="";
    $('#wildevol').prop("readonly", false);
  }
}
function changewildheart() {
  var wildheart = document.getElementById('wildheart');
  var wildheartcheck = document.getElementById('wildheartc');
  if (wildheartcheck.checked) {
    wildheart.value="0000";
    $('#wildheart').prop("readonly", true);
  }
  else {
    wildheart.value="";
    $('#wildheart').prop("readonly", false);
  }
}
function changewildresp() {
  var wildresp = document.getElementById('wildresp');
  var wildrespcheck = document.getElementById('wildrespc');
  if (wildrespcheck.checked) {
    wildresp.value="0000";
    $('#wildresp').prop("readonly", true);
  }
  else {
    wildresp.value="";
    $('#wildresp').prop("readonly", false);
  }
}
function changewildtemp() {
  var wildtemp = document.getElementById('wildtemp');
  var wildtempcheck = document.getElementById('wildtempc');
  if (wildtempcheck.checked) {
    wildtemp.value="0000";
    $('#wildtemp').prop("readonly", true);
  }
  else {
    wildtemp.value="";
    $('#wildtemp').prop("readonly", false);
  }
}
function changewildcap() {
  var wildcap = document.getElementById('wildcapilar');
  var wildcapcheck = document.getElementById('wildcapc');
  if (wildcapcheck.checked) {
    wildcap.value="0000";
    $('#wildcapilar').prop("readonly", true);
  }
  else {
    wildcap.value="";
    $('#wildcapilar').prop("readonly", false);
  }
}
function changewildmucos() {
  var wildmucos = document.getElementById('wildmucos');
  var wildmucoscheck = document.getElementById('wildmucoc');
  if (wildmucoscheck.checked) {
    wildmucos.value="Sin datos";
    $('#wildmucos').prop("readonly", true);
  }
  else {
    wildmucos.value="";
    $('#wildmucos').prop("readonly", false);
  }
}
function changewildlymph() {
  var wildlymph = document.getElementById('wildlymph');
  var wildlymphcheck = document.getElementById('wildlymphc');
  if (wildlymphcheck.checked) {
    wildlymph.value="Sin datos";
    $('#wildlymph').prop("readonly", true);
  }
  else {
    wildlymph.value="";
    $('#wildlymph').prop("readonly", false);
  }
}
function changewildruminal() {
  var wildage = document.getElementById('wildruminal');
  var wildagecheck = document.getElementById('wildruminalc');
  if (wildagecheck.checked) {
    wildage.value="Sin datos";
    $('#wildruminal').prop("readonly", true);
  }
  else {
    wildage.value="";
    $('#wildruminal').prop("readonly", false);
  }
}



// Aquatic organism form validation
function aqchangegene() {
  var aqgene = document.getElementById('aqgenetic');
  var aqgenecheck = document.getElementById('aqgenec');
  if (aqgenecheck.checked) {
    aqgene.value="Sin datos";
    $('#aqgenetic').prop("readonly", true);
  }
  else {
    aqgene.value="";
    $('#aqgenetic').prop("readonly", false);
  }
}
function aqchangezoo() {
  var catzoo = document.getElementById('aqzoo');
  var aqzoocheck = document.getElementById('aqzooc');
  if (aqzoocheck.checked) {
    aqzoo.value="Sin datos";
    $('#aqzoo').prop("readonly", true);
  }
  else {
    aqzoo.value="";
    $('#aqzoo').prop("readonly", false);
  }
}
function aqchangeage() {
  var aqage = document.getElementById('aqage');
  var aqagecheck = document.getElementById('aqagec');
  if (aqagecheck.checked) {
    aqage.value="0000";
    $('#aqage').prop("readonly", true);
    $('#aqday').prop("disabled", true);
    $('#aqmonth').prop("disabled", true);
    $('#aqyear').prop("disabled", true);
  }
  else {
    aqage.value="";
    $('#aqage').prop("readonly", false);
    $('#aqday').prop("disabled", false);
    $('#aqmonth').prop("disabled", false);
    $('#aqyear').prop("disabled", false);
  }
}
function aqchangeweight() {
  var aqweight = document.getElementById('aqweight');
  var aqweightcheck = document.getElementById('aqweightc');
  if (aqweightcheck.checked) {
    aqweight.value="0000";
    $('#aqweight').prop("readonly", true);
  }
  else {
    aqweight.value="";
    $('#aqweight').prop("readonly", false);
  }
}
function aqchangedensity() {
  var aqdensity = document.getElementById('aqdensity');
  var aqdensitycheck = document.getElementById('aqdensityc');
  if (aqdensitycheck.checked) {
    aqdensity.value="0000";
    $('#aqdensity').prop("readonly", true);
  }
  else {
    aqdensity.value="";
    $('#aqdensity').prop("readonly", false);
  }
}
function aqchangebiomass() {
  var aqbiomass = document.getElementById('aqbiomass');
  var aqbiomasscheck = document.getElementById('aqbiomassc');
  if (aqbiomasscheck.checked) {
    aqbiomass.value="0000";
    $('#aqbiomass').prop("readonly", true);
  }
  else {
    aqbiomass.value="";
    $('#aqbiomass').prop("readonly", false);
  }
}
function aqchangechange() {
  var aqchange = document.getElementById('aqchange');
  var aqchangecheck = document.getElementById('aqchangec');
  if (aqchangecheck.checked) {
    aqchange.value="0000";
    $('#aqchange').prop("readonly", true);
  }
  else {
    aqchange.value="";
    $('#aqchange').prop("readonly", false);
  }
}
function aqchangesowing() {
  var aqsowing = document.getElementById('aqsowing');
  var aqsowingcheck = document.getElementById('aqsowingc');
  if (aqsowingcheck.checked) {
    aqsowing.value="Sin datos";
    $('#aqsowing').prop("readonly", true);
  }
  else {
    aqsowing.value="";
    $('#aqsowing').prop("readonly", false);
  }
}
function aqchangetemp6() {
  var aqtemp6 = document.getElementById('aq6am');
  var aqtemp6check = document.getElementById('aqtemp6c');
  if (aqtemp6check.checked) {
    aqtemp6.value="0000";
    $('#aq6am').prop("readonly", true);
  }
  else {
    aqtemp6.value="";
    $('#aq6am').prop("readonly", false);
  }
}
function aqchangetemp3() {
  var aqtemp3 = document.getElementById('aq3pm');
  var aqtemp3check = document.getElementById('aqtemp3c');
  if (aqtemp3check.checked) {
    aqtemp3.value="0000";
    $('#aq3pm').prop("readonly", true);
  }
  else {
    aqtemp3.value="";
    $('#aq3pm').prop("readonly", false);
  }
}
function aqchangeox6() {
  var aqox6 = document.getElementById('aqox6');
  var aqox6check = document.getElementById('aqox6c');
  if (aqox6check.checked) {
    aqox6.value="0000";
    $('#aqox6').prop("readonly", true);
  }
  else {
    aqox6.value="";
    $('#aqox6').prop("readonly", false);
  }
}
function aqchangeox3() {
  var aqox3 = document.getElementById('aqox3');
  var aqox3check = document.getElementById('aqox3c');
  if (aqox3check.checked) {
    aqox3.value="0000";
    $('#aqox3').prop("readonly", true);
  }
  else {
    aqox3.value="";
    $('#aqox3').prop("readonly", false);
  }
}
function aqchangeph6() {
  var aqph6 = document.getElementById('aqph6');
  var aqph6check = document.getElementById('aqph6c');
  if (aqph6check.checked) {
    aqph6.value="0000";
    $('#aqph6').prop("readonly", true);
  }
  else {
    aqph6.value="";
    $('#aqph6').prop("readonly", false);
  }
}
function aqchangeph3() {
  var aqph3 = document.getElementById('aqph3');
  var aqph3check = document.getElementById('aqph3c');
  if (aqph3check.checked) {
    aqph3.value="0000";
    $('#aqph3').prop("readonly", true);
  }
  else {
    aqph3.value="";
    $('#aqph3').prop("readonly", false);
  }
}
function aqchangeaqno2() {
  var aqno2 = document.getElementById('aqno2');
  var aqno2check = document.getElementById('aqno2c');
  if (aqno2check.checked) {
    aqno2.value="0000";
    $('#aqno2').prop("readonly", true);
  }
  else {
    aqno2.value="";
    $('#aqno2').prop("readonly", false);
  }
}
function aqchangeaqnh4() {
  var aqnh4 = document.getElementById('aqnh4');
  var aqnh4check = document.getElementById('aqnh4c');
  if (aqnh4check.checked) {
    aqnh4.value="0000";
    $('#aqnh4').prop("readonly", true);
  }
  else {
    aqnh4.value="";
    $('#aqnh4').prop("readonly", false);
  }
}
function aqchangeaqnh3() {
  var aqnh3 = document.getElementById('aqnh3');
  var aqnh3check = document.getElementById('aqnh3c');
  if (aqnh3check.checked) {
    aqnh3.value="0000";
    $('#aqnh3').prop("readonly", true);
  }
  else {
    aqnh3.value="";
    $('#aqnh3').prop("readonly", false);
  }
}
function aqchangetransp() {
  var aqtransp = document.getElementById('aqtransp');
  var aqtranspcheck = document.getElementById('aqtranspc');
  if (aqtranspcheck.checked) {
    aqtransp.value="0000";
    $('#aqtransp').prop("readonly", true);
  }
  else {
    aqtransp.value="";
    $('#aqtransp').prop("readonly", false);
  }
}
function aqchangemort() {
  var aqmort = document.getElementById('aqmort');
  var aqmortcheck = document.getElementById('aqmortc');
  if (aqmortcheck.checked) {
    aqmort.value="0000";
    $('#aqmort').prop("readonly", true);
  }
  else {
    aqmort.value="";
    $('#aqmort').prop("readonly", false);
  }
}
function aqchangestr() {
  var aqstr = document.getElementById('aqstr');
  var aqstrcheck = document.getElementById('aqstrc');
  if (aqstrcheck.checked) {
    aqstr.value="0000";
    $('#aqstr').prop("readonly", true);
  }
  else {
    aqstr.value="";
    $('#aqstr').prop("readonly", false);
  }
}


// Bee form validation
function beechangespecie() {
  var hrspecie = document.getElementById('beespecie');
  var hrspeciecheck = document.getElementById('beespeciec');
  if (hrspeciecheck.checked) {
    hrspecie.value="Sin datos";
    $('#beespecie').prop("readonly", true);
  }
  else {
    hrspecie.value="";
    $('#beespecie').prop("readonly", false);
  }
}
function beechangeback() {
  var hrback = document.getElementById('beeback');
  var hrbackcheck = document.getElementById('beebackc');
  if (hrbackcheck.checked) {
    hrback.value="0000";
    $('#beeback').prop("readonly", true);
  }
  else {
    hrback.value="";
    $('#beeback').prop("readonly", false);
  }
}
function beechangecell() {
  var hrcell = document.getElementById('beecell');
  var hrcellcheck = document.getElementById('beecellc');
  if (hrcellcheck.checked) {
    hrcell.value="Sin datos";
    $('#beecell').prop("readonly", true);
  }
  else {
    hrcell.value="";
    $('#beecell').prop("readonly", false);
  }
}
function beechangebckbreed() {
  var hrbckbreed = document.getElementById('beebckbreed');
  var hrbckbreedcheck = document.getElementById('beebckbreedc');
  if (hrbckbreedcheck.checked) {
    hrbckbreed.value="0000";
    $('#beebckbreed').prop("readonly", true);
  }
  else {
    hrbckbreed.value="";
    $('#beebckbreed').prop("readonly", false);
  }
}
function beechangeegg() {
  var hregg = document.getElementById('beeegg');
  var hreggcheck = document.getElementById('beeeggc');
  if (hreggcheck.checked) {
    hregg.value="0000";
    $('#beeegg').prop("readonly", true);
  }
  else {
    hregg.value="";
    $('#beeegg').prop("readonly", false);
  }
}
function beechangequant() {
  var hrquant = document.getElementById('beequant');
  var hrquantcheck = document.getElementById('beequantc');
  if (hrquantcheck.checked) {
    hrquant.value="0000";
    $('#beequant').prop("readonly", true);
  }
  else {
    hrquant.value="";
    $('#beequant').prop("readonly", false);
  }
}
function beechangeobs() {
  var hrobs = document.getElementById('beeobs');
  var hrobscheck = document.getElementById('beeobsc');
  if (hrobscheck.checked) {
    hrobs.value="Sin datos";
    $('#beeobs').prop("readonly", true);
  }
  else {
    hrobs.value="";
    $('#beeobs').prop("readonly", false);
  }
}
function beechangerack() {
  var hrrack = document.getElementById('beerack');
  var hrrackcheck = document.getElementById('beerackc');
  if (hrrackcheck.checked) {
    hrrack.value="0000";
    $('#beerack').prop("readonly", true);
  }
  else {
    hrrack.value="";
    $('#beerack').prop("readonly", false);
  }
}
function beechangehive() {
  var hrrack = document.getElementById('beehive');
  var hrrackcheck = document.getElementById('beehivec');
  if (hrrackcheck.checked) {
    hrrack.value="Sin datos";
    $('#beehive').prop("readonly", true);
  }
  else {
    hrrack.value="";
    $('#beehive').prop("readonly", false);
  }
}
function beechangesigns() {
  var hrrack = document.getElementById('beesigns');
  var hrrackcheck = document.getElementById('beesignsc');
  if (hrrackcheck.checked) {
    hrrack.value="Sin datos";
    $('#beesigns').prop("readonly", true);
  }
  else {
    hrrack.value="";
    $('#beesigns').prop("readonly", false);
  }
}


// Toggle mail list and card list
function showMail() {
  document.getElementById("userQuestions" ).style.display = 'initial';
  document.getElementById("userCards" ).style.display = 'none';
}
function showCard() {
  document.getElementById("userQuestions" ).style.display = 'none';
  document.getElementById("userCards" ).style.display = 'initial';
}


// Validations for age input
// Cow
$('#cowday').on('change', function () {
    if ($(this).is(':checked')) {
        $('#cowage').val($('#cowage').val() + $(this).val());
    } else {
        $('#cowage').val($('#cowage').val().replace($(this).val(), ''));
    }
});
$('#cowmonth').on('change', function () {
    if ($(this).is(':checked')) {
        $('#cowage').val($('#cowage').val() + $(this).val());
    } else {
        $('#cowage').val($('#cowage').val().replace($(this).val(), ''));
    }
});
$('#cowyear').on('change', function () {
    if ($(this).is(':checked')) {
        $('#cowage').val($('#cowage').val() + $(this).val());
    } else {
        $('#cowage').val($('#cowage').val().replace($(this).val(), ''));
    }
});
// Porcine
$('#porday').on('change', function () {
    if ($(this).is(':checked')) {
        $('#porage').val($('#porage').val() + $(this).val());
    } else {
        $('#porage').val($('#porage').val().replace($(this).val(), ''));
    }
});
$('#pormonth').on('change', function () {
    if ($(this).is(':checked')) {
        $('#porage').val($('#porage').val() + $(this).val());
    } else {
        $('#porage').val($('#porage').val().replace($(this).val(), ''));
    }
});
$('#poryear').on('change', function () {
    if ($(this).is(':checked')) {
        $('#porage').val($('#porage').val() + $(this).val());
    } else {
        $('#porage').val($('#porage').val().replace($(this).val(), ''));
    }
});
// Horse
$('#horseday').on('change', function () {
    if ($(this).is(':checked')) {
        $('#horage').val($('#horage').val() + $(this).val());
    } else {
        $('#horage').val($('#horage').val().replace($(this).val(), ''));
    }
});
$('#horsemonth').on('change', function () {
    if ($(this).is(':checked')) {
        $('#horage').val($('#horage').val() + $(this).val());
    } else {
        $('#horage').val($('#horage').val().replace($(this).val(), ''));
    }
});
$('#horseyear').on('change', function () {
    if ($(this).is(':checked')) {
        $('#horage').val($('#horage').val() + $(this).val());
    } else {
        $('#horage').val($('#horage').val().replace($(this).val(), ''));
    }
});
// Ovine
$('#oviday').on('change', function () {
    if ($(this).is(':checked')) {
        $('#oviage').val($('#oviage').val() + $(this).val());
    } else {
        $('#oviage').val($('#oviage').val().replace($(this).val(), ''));
    }
});
$('#ovimonth').on('change', function () {
    if ($(this).is(':checked')) {
        $('#oviage').val($('#oviage').val() + $(this).val());
    } else {
        $('#oviage').val($('#oviage').val().replace($(this).val(), ''));
    }
});
$('#oviyear').on('change', function () {
    if ($(this).is(':checked')) {
        $('#oviage').val($('#oviage').val() + $(this).val());
    } else {
        $('#oviage').val($('#oviage').val().replace($(this).val(), ''));
    }
});
// Goat
$('#goatday').on('change', function () {
    if ($(this).is(':checked')) {
        $('#goatage').val($('#goatage').val() + $(this).val());
    } else {
        $('#goatage').val($('#goatage').val().replace($(this).val(), ''));
    }
});
$('#goatmonth').on('change', function () {
    if ($(this).is(':checked')) {
        $('#goatage').val($('#goatage').val() + $(this).val());
    } else {
        $('#goatage').val($('#goatage').val().replace($(this).val(), ''));
    }
});
$('#goatyear').on('change', function () {
    if ($(this).is(':checked')) {
        $('#goatage').val($('#goatage').val() + $(this).val());
    } else {
        $('#goatage').val($('#goatage').val().replace($(this).val(), ''));
    }
});
// Rabbir
$('#rabday').on('change', function () {
    if ($(this).is(':checked')) {
        $('#rabage').val($('#rabage').val() + $(this).val());
    } else {
        $('#rabage').val($('#rabage').val().replace($(this).val(), ''));
    }
});
$('#rabmonth').on('change', function () {
    if ($(this).is(':checked')) {
        $('#rabage').val($('#rabage').val() + $(this).val());
    } else {
        $('#rabage').val($('#rabage').val().replace($(this).val(), ''));
    }
});
$('#rabyear').on('change', function () {
    if ($(this).is(':checked')) {
        $('#rabage').val($('#rabage').val() + $(this).val());
    } else {
        $('#rabage').val($('#rabage').val().replace($(this).val(), ''));
    }
});
// Dog
$('#dogday').on('change', function () {
    if ($(this).is(':checked')) {
        $('#dogage').val($('#dogage').val() + $(this).val());
    } else {
        $('#dogage').val($('#dogage').val().replace($(this).val(), ''));
    }
});
$('#dogmonth').on('change', function () {
    if ($(this).is(':checked')) {
        $('#dogage').val($('#dogage').val() + $(this).val());
    } else {
        $('#dogage').val($('#dogage').val().replace($(this).val(), ''));
    }
});
$('#dogyear').on('change', function () {
    if ($(this).is(':checked')) {
        $('#dogage').val($('#dogage').val() + $(this).val());
    } else {
        $('#dogage').val($('#dogage').val().replace($(this).val(), ''));
    }
});
// Cat
$('#catday').on('change', function () {
    if ($(this).is(':checked')) {
        $('#catage').val($('#catage').val() + $(this).val());
    } else {
        $('#catage').val($('#catage').val().replace($(this).val(), ''));
    }
});
$('#catmonth').on('change', function () {
    if ($(this).is(':checked')) {
        $('#catage').val($('#catage').val() + $(this).val());
    } else {
        $('#catage').val($('#catage').val().replace($(this).val(), ''));
    }
});
$('#catyear').on('change', function () {
    if ($(this).is(':checked')) {
        $('#catage').val($('#catage').val() + $(this).val());
    } else {
        $('#catage').val($('#catage').val().replace($(this).val(), ''));
    }
});
// Aquatic organisms
$('#aqday').on('change', function () {
    if ($(this).is(':checked')) {
        $('#aqage').val($('#aqage').val() + $(this).val());
    } else {
        $('#aqage').val($('#aqage').val().replace($(this).val(), ''));
    }
});
$('#aqmonth').on('change', function () {
    if ($(this).is(':checked')) {
        $('#aqage').val($('#aqage').val() + $(this).val());
    } else {
        $('#aqage').val($('#aqage').val().replace($(this).val(), ''));
    }
});
$('#aqyear').on('change', function () {
    if ($(this).is(':checked')) {
        $('#aqage').val($('#aqage').val() + $(this).val());
    } else {
        $('#aqage').val($('#aqage').val().replace($(this).val(), ''));
    }
});