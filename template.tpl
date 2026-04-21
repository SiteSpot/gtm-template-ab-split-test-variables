___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.

___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "AB Split Test - Variables",
  "brand": {
    "id": "brand_dummy",
    "displayName": "AB Split Test"
  },
  "description": "Extracts AB Split Test experiment data from the dataLayer for use in any tag or trigger.",
  "containerContexts": [
    "WEB"
  ],
  "categories": [
    "UTILITY"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "SELECT",
    "name": "variableType",
    "displayName": "Variable to Return",
    "macrosInSelect": false,
    "selectItems": [
      {
        "value": "test_id",
        "displayValue": "Test ID"
      },
      {
        "value": "test_name",
        "displayValue": "Test Name"
      },
      {
        "value": "test_variation",
        "displayValue": "Test Variation"
      },
      {
        "value": "test_event",
        "displayValue": "Test Event Type"
      },
      {
        "value": "abuuid",
        "displayValue": "AB UUID (Advanced ID)"
      },
      {
        "value": "all",
        "displayValue": "All Data (JSON Object)"
      }
    ],
    "simpleValueType": true,
    "defaultValue": "test_id",
    "help": "Select which AB Split Test data point to return."
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

// AB Split Test - Variables Template
// Extracts experiment data from dataLayer

const copyFromDataLayer = require('copyFromDataLayer');
const log = require('logToConsole');
const createQueue = require('createQueue');
const JSON = require('JSON');

const variableType = data.variableType;

// Try to get data from the current dataLayer event
let testId = copyFromDataLayer('test_id');
let testName = copyFromDataLayer('test_name');
let testVariation = copyFromDataLayer('test_variation');
let testEvent = copyFromDataLayer('test_event');
let abuuid = copyFromDataLayer('abuuid');

// Return the requested variable
if (variableType === 'test_id') {
  return testId || '';
}

if (variableType === 'test_name') {
  return testName || '';
}

if (variableType === 'test_variation') {
  return testVariation || '';
}

if (variableType === 'test_event') {
  return testEvent || '';
}

if (variableType === 'abuuid') {
  return abuuid || '';
}

if (variableType === 'all') {
  const allData = {
    test_id: testId || '',
    test_name: testName || '',
    test_variation: testVariation || '',
    test_event: testEvent || '',
    abuuid: abuuid || ''
  };
  return allData;
}

return '';


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "read_data_layer",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keyPatterns",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "test_id"
              },
              {
                "type": 1,
                "string": "test_name"
              },
              {
                "type": 1,
                "string": "test_variation"
              },
              {
                "type": 1,
                "string": "test_event"
              },
              {
                "type": 1,
                "string": "abuuid"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []
setup: ''


___NOTES___

User Notes: This template extracts AB Split Test experiment data from the dataLayer for use in any GTM tag or trigger.


___TERMS_OF_SERVICE___

By using this template, you agree to the terms of service available at https://github.com/SiteSpot/gtm-template-ab-split-test-variables
