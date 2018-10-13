package routers

import (
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/context/param"
)

func init() {

	beego.GlobalControllerRouter["tblox/controllers:InvoiceProcessingController"] = append(beego.GlobalControllerRouter["tblox/controllers:InvoiceProcessingController"],
		beego.ControllerComments{
			Method: "GetByInvoiceId",
			Router: `/api/v1/invoiceprocessing/invoice/:id`,
			AllowHTTPMethods: []string{"get"},
			MethodParams: param.Make(
				param.New("id", param.InPath),
			),
			Params: nil})

}
