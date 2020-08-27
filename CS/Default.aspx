<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.17.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>How to implement the "Select All" CheckBox editor in the ASPxGridView's row in Batch Edit Mode</title>
    <script type="text/javascript">
        var checkBoxColumns = ['One', 'Two', 'Three'];
        var lastEditedColumn;
        var rowIndex;
        function OnBatchEditStartEditing(s, e) {
            lastEditedColumn = e.focusedColumn.fieldName;
            rowIndex = e.visibleIndex;
        }

        function OnAllCheckedChanged(s, e) {
            if (s.GetValue() == -1) s.SetValue(1);
            for (var i = 0; i < checkBoxColumns.length; i++) {
                MyGridView.batchEditApi.SetCellValue(rowIndex, checkBoxColumns[i], s.GetChecked());
            }
        }

        function OnCheckedChanged(s, e) {
            var IsAllCheckedEditors = s.GetChecked();
            var IsOneEditorChecked = s.GetChecked();
            for (var i = 0; i < checkBoxColumns.length; i++) {
                if (checkBoxColumns[i] != lastEditedColumn) {
                    IsAllCheckedEditors = IsAllCheckedEditors && MyGridView.batchEditApi.GetCellValue(rowIndex, checkBoxColumns[i]);
                    IsOneEditorChecked = IsOneEditorChecked || MyGridView.batchEditApi.GetCellValue(rowIndex, checkBoxColumns[i]);
                }
            }
            MyGridView.batchEditApi.SetCellValue(rowIndex, "All", Number(IsAllCheckedEditors));
            if (!IsAllCheckedEditors && IsOneEditorChecked)
                MyGridView.batchEditApi.SetCellValue(rowIndex, "All", -1);
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxGridView ID="MyGridView" ClientInstanceName="MyGridView" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="CategoryID" OnBatchUpdate="MyGridView_BatchUpdate">
                <ClientSideEvents BatchEditStartEditing="OnBatchEditStartEditing" />
                <SettingsEditing Mode="Batch">
                    <BatchEditSettings EditMode="Cell" />
                </SettingsEditing>
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="CategoryID" ReadOnly="True" VisibleIndex="0">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CategoryName" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Description" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataCheckColumn FieldName="All" UnboundExpression="0" UnboundType="Integer" VisibleIndex="3">
                        <PropertiesCheckEdit ClientInstanceName="CheckBoxAll" AllowGrayed="true" ValueType="System.Int32" ValueGrayed="-1">
                            <ClientSideEvents CheckedChanged="OnAllCheckedChanged" />
                        </PropertiesCheckEdit>
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataCheckColumn FieldName="One" UnboundExpression="false" UnboundType="Boolean" VisibleIndex="4">
                        <PropertiesCheckEdit ClientInstanceName="CheckBoxOne">
                            <ClientSideEvents CheckedChanged="OnCheckedChanged" />
                        </PropertiesCheckEdit>
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataCheckColumn FieldName="Two" UnboundExpression="false" UnboundType="Boolean" VisibleIndex="5">
                        <PropertiesCheckEdit ClientInstanceName="CheckBoxTwo">
                            <ClientSideEvents CheckedChanged="OnCheckedChanged" />
                        </PropertiesCheckEdit>
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataCheckColumn FieldName="Three" UnboundExpression="false" UnboundType="Boolean" VisibleIndex="6">
                        <PropertiesCheckEdit ClientInstanceName="CheckBoxThree">
                            <ClientSideEvents CheckedChanged="OnCheckedChanged" />
                        </PropertiesCheckEdit>
                    </dx:GridViewDataCheckColumn>
                </Columns>
            </dx:ASPxGridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NORTHWNDConnectionString %>" SelectCommand="SELECT [CategoryID], [CategoryName], [Description] FROM [Categories]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
