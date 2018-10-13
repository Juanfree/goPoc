package controllers

import (
	"github.com/astaxie/beego"
	readModel "tblox/readmodel"
)

type InvoiceProcessingController struct {
	beego.Controller
}

// @router /api/v1/invoiceprocessing/invoice/:id [get]
func (this *InvoiceProcessingController) GetByInvoiceId(id int) {

	var e readModel.ElasticGetByInvoiceId
	l := e.New()

	a := make(map[string]string)

	a["asdas"] = l.GetByInvoiceId(10)

	this.Data["json"] = a

	this.ServeJSON()
}