import React from 'react';
import VariantsList from './VariantsList';
import { Container, Row, Col, Table, Jumbotron } from 'react-bootstrap';
import { Link } from 'react-router-dom'

const VariantsTable = props => {
  if (Array.isArray(props.variants)) {
    return(
      <Container>
        <Jumbotron fluid>
          <Container>
            <Row>
              <Col className="d-flex">
                <h3 className="mt-5">
                  Variants
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
              <th>Price</th>
              <th>Created</th>
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