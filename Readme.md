# Implement the "Select All" CheckBox editor in ASPxGridView's row in Batch Edit Mode


<p>This example illustrates how to change editors based on other editors in a current row when ASPxGridView in Batch Edit Mode. <br />If an end-user checks the check box in ASPxGridView's "All" column, other check boxes in this row will be set checked. If an end-user unchecks the check box in the ASPxGridView's "All" column, other check boxes in this row will become unchecked. If all check boxes in ASPxGridView's row are checked, the check box in ASPxGridView's "All" columns will be set checked. If at least one of check boxes in ASPxGridView's row is checked, the check box in ASPxGridView's "All" column  will become grayed.</p>
<p>To allow the "All" check boxes grayed state, use the <a href="https://documentation.devexpress.com/#AspNet/DevExpressWebCheckBoxProperties_AllowGrayedtopic">CheckBoxProperties.AllowGrayed,   </a><a href="https://documentation.devexpress.com/#AspNet/DevExpressWebCheckBoxProperties_ValueTypetopic">CheckBoxProperties.ValueType, </a><a href="https://documentation.devexpress.com/#AspNet/DevExpressWebCheckBoxProperties_ValueGrayedtopic">CheckBoxProperties.ValueGrayed</a><a href="https://documentation.devexpress.com/#AspNet/DevExpressWebCheckBoxProperties_ValueTypetopic"> </a> properties.</p>
<p>To implement the described scenario in common, handle the <a href="https://documentation.devexpress.com/#AspNet/DevExpressWebScriptsASPxClientGridView_BatchEditStartEditingtopic">ASPxClientGridView.BatchEditStartEditing</a> and <a href="https://documentation.devexpress.com/#AspNet/DevExpressWebCheckEditClientSideEvents_CheckedChangedtopic">CheckEditClientSideEvents.CheckedChanged</a> events.</p>
<p>Note that unbound columns are used because the example database does not contain appropriate data to illustrate this scenario. This approach can be also easily applied to bound columns.</p>

<br/>


