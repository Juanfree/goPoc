package readmodel

type ElasticGetByInvoiceId struct {
	elastic string
}

func (this ElasticGetByInvoiceId) New () *ElasticGetByInvoiceId {
	e := ElasticGetByInvoiceId{elastic:"sdsdsdsdsd"}
	return &e
}

func(this ElasticGetByInvoiceId) GetByInvoiceId(id int) string {
	return this.elastic
}