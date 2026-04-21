# AB Split Test - Variables

This folder is a draft standalone GitHub repository for the Google Tag Manager Community Template Gallery submission of the `AB Split Test - Variables` template.

## Where this goes

Copy the contents of this folder into its own public GitHub repository root:

- `template.tpl`
- `metadata.yaml`
- `LICENSE`
- `README.md`

Suggested repository name:

- `gtm-template-ab-split-test-variables`

## Template identity

- **Display name**: AB Split Test - Variables
- **Type**: Variable Template
- **Categories**: `UTILITY`

## Template purpose

This variable template extracts AB Split Test experiment data from the GTM dataLayer, making it easy to use in any tag, trigger, or other variable.

The WordPress plugin pushes this event to the dataLayer:

```javascript
dataLayer.push({
  'event': 'ab_split_test',
  'test_id': '123',
  'test_name': 'Button Color Test',
  'test_variation': 'Variation B',
  'test_event': 'visit',
  'abuuid': 'uuid-string'
});
```

This template lets you extract any of those values as GTM variables.

## Available Variables

Create one variable for each data point you need:

| Variable Type | Returns | Example |
|--------------|---------|---------|
| **Test ID** | Experiment ID number | `123` |
| **Test Name** | Human-readable test name | `Button Color Test` |
| **Test Variation** | Variation identifier | `Variation B` |
| **Test Event Type** | Event type (visit/conversion/goal) | `visit` |
| **AB UUID** | Advanced tracking ID | `uuid-string` |
| **All Data** | JSON object with all fields | `{test_id: "123", ...}` |

## How to use

### Setup (one-time):

1. Import this template from the Community Template Gallery
2. Create variables for the data points you need:
   - Variable 1: "AB Test - ID" → select "Test ID"
   - Variable 2: "AB Test - Name" → select "Test Name"
   - Variable 3: "AB Test - Variation" → select "Test Variation"
   - etc.

### Use in tags:

Now you can reference these variables anywhere in GTM:

**Example 1: Send to Google Analytics 4**
- Tag Type: GA4 Event
- Event Name: `ab_split_test`
- Event Parameters:
  - `test_id`: `{{AB Test - ID}}`
  - `test_name`: `{{AB Test - Name}}`
  - `test_variation`: `{{AB Test - Variation}}`

**Example 2: Send to Facebook Pixel**
- Tag Type: Facebook Pixel
- Event Name: Custom Event
- Event Parameters:
  - `ab_test_id`: `{{AB Test - ID}}`
  - `ab_variation`: `{{AB Test - Variation}}`

**Example 3: Send to Google Ads**
- Tag Type: Google Ads Conversion
- Conversion Label: Your label
- Custom Parameters:
  - `test_variation`: `{{AB Test - Variation}}`

**Example 4: Use in triggers**
- Trigger Type: Custom Event
- Event Name: `ab_split_test`
- Fire when: `{{AB Test - Variation}}` equals `Variation B`

## Benefits

✅ **Universal**: Works with any tag (GA4, Facebook, Google Ads, webhooks, etc.)  
✅ **Flexible**: Send AB test data to multiple destinations  
✅ **Simple**: No coding required - just select from dropdown  
✅ **Reusable**: Create variables once, use everywhere  

## Recommended workflow

1. **WordPress plugin** pushes `ab_split_test` event to dataLayer
2. **This template** extracts the data as GTM variables
3. **Your tags** use those variables to send data wherever you want:
   - Google Analytics 4
   - Facebook Pixel
   - Google Ads
   - Mixpanel
   - Segment
   - Custom webhooks
   - Anywhere!

## Submission checklist

- [ ] Copy this folder into its own public GitHub repository root
- [ ] Update `metadata.yaml` SHA after first commit in the standalone repo
- [ ] Keep `LICENSE` as Apache 2.0 only
- [ ] Ensure GitHub issues are enabled
- [ ] Submit to Google Community Template Gallery
