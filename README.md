# String Calculator API — Ruby on Rails (TDD Kata)

This is a String Calculator API built using Ruby on Rails and Test-Driven Development (TDD). It parses a given string of numbers with various delimiters and returns their sum.

## Setup

```bash
git clone https://github.com/GopalPatoliya/string-calculator-api.git
cd string-calculator-api
bundle install
rails db:create db:migrate
rails server

## API Endpoint

POST /calculate

## Body
{
  "input": "//[**][%%]\n1**2%%3"
}

## Response
{
  "result": 6
}



## RUN tests
bundle exec rspec

## Example cURL Request

```bash
curl -X POST http://localhost:3000/calculate \
  -H "Content-Type: application/json" \
  -d '{"input": "//[***]\n1***2***3"}'


