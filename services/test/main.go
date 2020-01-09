package main

import (
	"bytes"
	"encoding/json"
	"fmt"

	"github.com/aws/aws-lambda-go/events"
	"github.com/aws/aws-lambda-go/lambda"
)

// Response is of type APIGatewayProxyResponse since we're leveraging the
// AWS Lambda Proxy Request functionality (default behavior)
//
// https://serverless.com/framework/docs/providers/aws/events/apigateway/#lambda-proxy-integration
type Response events.APIGatewayProxyResponse

type RequestJSON struct {
	Name    string `json:"name"`
	Request string `json:"request"`
}

// Handler is our lambda handler invoked by the `lambda.Start` function call
func Handler(req events.APIGatewayProxyRequest) (Response, error) {
	var buf bytes.Buffer

	if req.QueryStringParameters["request"] == "" {
		return Response{StatusCode: 404, Body: "'request' parameter is necessary"}, nil
	}

	var mess string = fmt.Sprintf("Function successfully received! Thanks %s for your request: %s", req.PathParameters["name"], req.QueryStringParameters["request"])

	body, err := json.Marshal(map[string]interface{}{
		"message": mess,
	})
	if err != nil {
		return Response{StatusCode: 404}, err
	}
	json.HTMLEscape(&buf, body)

	resp := Response{
		StatusCode:      200,
		IsBase64Encoded: false,
		Body:            buf.String(),
		Headers: map[string]string{
			"Content-Type":           "application/json",
			"X-MyCompany-Func-Reply": "test-handler",
		},
	}

	return resp, nil
}

func main() {
	lambda.Start(Handler)
}
