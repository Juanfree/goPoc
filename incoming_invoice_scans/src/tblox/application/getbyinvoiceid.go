package application

import "tblox/readmodel"

type GetByInvoiceId struct {
	r readmodel.GetByInvoiceId
}

func (this GetByInvoiceId) Execute(id int) string {
	return this.r.GetByInvoiceId(id)
}