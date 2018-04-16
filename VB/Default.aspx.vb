Imports DevExpress.Web
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls

Partial Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub MyGridView_BatchUpdate(ByVal sender As Object, ByVal e As DevExpress.Web.Data.ASPxDataBatchUpdateEventArgs)
        e.Handled = True
        ' Data update in online examples is not allowed.

    End Sub
End Class

