import React from 'react';
import createOrder from '../actions/createOrder'
import { connect } from 'react-redux';
import { Form, Button } from 'react-bootstrap';

class OrdersForm extends React.Component {

  handleSubmit = e => {
    e.preventDefault();
    const data = {
      orderTitle: e.target.querySelector('input[name="orderTitle"]').value,
      orderDescription: e.target.querySelector('input[name="orderDescription"]').value,
      orderTags: e.target.querySelector('input[name="orderTags"]').value
    }
    this.props.createOrder(data);
  }

  render() {
    return (
      <>
        <Form>
          <Form.Group controlId="formBasicEmail">
            <Form.Label>Email address</Form.Label>
            <Form.Control type="email" placeholder="Enter email" />
            <Form.Text className="text-muted">
              Well never share your email with anyone else.
            </Form.Text>
          </Form.Group>

          <Form.Group controlId="formBasicPassword">
            <Form.Label>Password</Form.Label>
            <Form.Control type="password" placeholder="Password" />
          </Form.Group>
          <Form.Group controlId="formBasicCheckbox">
            <Form.Check type="checkbox" label="Check me out" />
          </Form.Group>
          <Button variant="primary" type="submit">
            Submit
          </Button>
        </Form>
      </>
    )
  }
}

const mapDispatchToProps = dispatch => {
  return {
    createOrder: (data) => dispatch(createOrder(data))
  }
}

export default connect(null, mapDispatchToProps)(OrdersForm);