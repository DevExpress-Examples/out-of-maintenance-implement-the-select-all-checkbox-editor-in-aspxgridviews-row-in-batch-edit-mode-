using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page {
    protected void MyGridView_BatchUpdate(object sender, DevExpress.Web.Data.ASPxDataBatchUpdateEventArgs e) {
        e.Handled = true;
        // Data update in online examples is not allowed.

    }
}

