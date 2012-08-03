// Custom Javascript added by deinerso on 2012-06-06

// Returns the value of the element with the id="factor" attribute
// It's the dropdown on the tab id="#demo"
// These functions are used by both backbone and without backbone.
function getFactor() {
  return $('#factor').val();
}

// Return am HTML fragment, a table row in this case.
function formatLine( item ) {
  return $('<tr><td>' + item.value + '</td><td>' + item.product + '</td></tr>' );
}

// Return an HTML fragment, a table row in this case.
function formatInstitution( item ) {
  cy = new Date(item.customerYear).toLocaleDateString()
  return $('<tr><td>' + item.name + '</td><td><a href="' + item.factBookUrl + '" target="_blank">' + item.factBookUrl + '</a></td><td>' + item.city + '</td><td>' + cy + '</td><td>' + item.healthSciencesInd + '</td><td>' + item.hospitalInd + '</td></tr>' );
}

//////////////////// Without Backbone
// provide functions to get the data from the server and update the HTML
// elements as needed
function updateResultsTable( data ) {
  var target = $('#results tbody');
  target.empty();

  for ( var i in data ) {
    target.append( formatLine( data[i] ));
  }
}

// Get the desired element fragmant, the tbody, empty it, then append
// each row while formatting it.
function updateInstitutionsTable( data ) {
  var target = $('#db-demo-results tbody');
  target.empty();

  for ( var i in data ) {
    target.append( formatInstitution( data[i] ));
  }
}

// Declare and get the value of the dropdown as a parameter to pass to the
// server. The "data" is passed as a mapped or named parameter. Named parameters
// enable having the parameters in any order in the parameter array passed to
// the server.
// The url takes the form controller/action?data={data}
// Upon success the updateResultsTable function is called. It is aware of the
// ( data ) being passed back even though we don't use that function call
// signature.
function updateWithoutBackbone() {
  var data = {
    factor:getFactor()
  };
  $.ajax( {
    url: serverUrl,
    data: data,
    success: updateResultsTable
  } );
}

// Select all Institution rows using "institution/list".
// Upon success, execute the updateInstitutionsTable function.
function selectWithoutBackbone() {
  $.ajax({
    type: 'GET',
    contentType: 'text/json',
    url: serverUrlInstitution,
    success: updateInstitutionsTable,
    dataType: 'json'
  });
}

// Called by the javascript #factor elements bound change event in index.gsp
// on tab id="demo"
function updateWithBackbone() {
  resultsCollection.fetch({
    data: {
      factor: getFactor()
    }
  });
}

// Called by the javascript #factor elements bound change event in index.gsp
// on tab id="db-demo"
function selectWithBoth() {
  // Backbone AJAX:
  institutionResultsCollection.fetch();

  // jQuery AJAX:
  $.ajax({
    type: 'GET',
    contentType: 'text/json',
    url: serverUrlInstitution,
    success: updateInstitutionsTable,
    dataType: 'json'
  });
}