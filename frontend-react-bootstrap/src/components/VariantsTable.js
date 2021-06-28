import React from 'react';
import VariantsList from './VariantsList';
import { Container, Row, Col, Table, Jumbotron } from 'react-bootstrap';

const VariantsTable = props => {
  if (Array.isArray(props.variants)) {
    return(
      <Container>
        <Jumbotron fluid>
          <Container>
            <Row>
              <Col>
                <h1 className="mt-5 d-flex justify-content-between">
                  Variants
                </h1>
              </Col>
            </Row>
          </Container>
        </Jumbotron>
        <Table striped bordered hover>
          <thead>
            <tr>
              <th>ID</th>
              <th>Kind</th>
              <th>Reference</th>
              <th>Status</th>
              <th>Price</th>
              <th>Created</th>
              <th>Variants</th>
            </tr>
          </thead>
          <tbody>
            <VariantsList variants={props.variants} />
          </tbody>
        </Table>
      </Container>
    )
  } else {
    return <h3>No variants yet</h3>
  }
}

export default VariantsTable;