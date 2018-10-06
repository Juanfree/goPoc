package controllers

import (
	"github.com/revel/revel"
	"src/github.com/olivere/elastic"
	"github.com/pkg/errors"
	"golang.org/x/net/context"
)

func (c App) InvoiceProcessingIndex() revel.Result {
	return c.RenderJSON(10)
}

func (c App) InvoiceProcessingById(id int) revel.Result {

	client, err := elastic.NewClient(
		elastic.SetURL("http://elasticsearch:9200"),
		elastic.SetSniff(false),
	)

	if err != nil {
		panic(err)
	}

	res, err := client.CreateIndex("juanfra").Do(context.TODO())

	if err != nil {
		panic(err)
	}

	if !res.Acknowledged {
		panic(errors.New("CreateIndex was not acknowledged. Check that timeout value is correct."))
	}

	return c.RenderJSON(client)
}