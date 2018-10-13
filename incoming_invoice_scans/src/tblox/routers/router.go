package routers

import (
	"github.com/astaxie/beego"
	"tblox/controllers"
)

func init() {
	beego.Include(&controllers.InvoiceProcessingController{})
}