import React from 'react';
import ProductsList from './ProductsList';
import { Container, Row, Col, Table, Jumbotron } from 'react-bootstrap';

const ProductsTable = props => {
  if (props.products) {
    return(
      <Container>
        <Jumbotron fluid>
          <Container>
            <Row>
              <Col>
                <h3 className="mt-5 d-flex justify-content-between">
                  Products
                </h3>
              </Col>
            </Row>
          </Container>
        </Jumbotron>
        <Table striped bordered hover>
          <thead>
            <tr>
              <th>ID</th>
              <th>Title</th>
              <th>Vendor</th>
              <th>Product Type</th>
              <th>Status</th>
              <th>Created</th>
              <th>Variants</th>
            </tr>
          </thead>
          <tbody>
            <ProductsList products={props.products} />
          </tbody>
        </Table>
      </Container>
    )
  } else {
    return <div>No products yet</div>
  }
}

export default ProductsTable;