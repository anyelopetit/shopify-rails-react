import React from 'react';
import { Link } from 'react-router-dom';
import {
  Container,
  Navbar,
  Nav,
} from 'react-bootstrap'

const AppNavbar = () => {
  return (
    <Navbar bg="light" expand="lg">
      <Container>
        <Navbar.Brand as={Link} to="/">Shipit Test</Navbar.Brand>
        <Navbar.Toggle aria-controls="basic-navbar-nav" />
        <Navbar.Collapse id="basic-navbar-nav">
          <Nav className="mr-auto">
            <Nav.Link as={Link} to="/" className="nav-link">Orders</Nav.Link>
          </Nav>
          <Nav className="mr-auto">
            <Nav.Link as={Link} to="/products" className="nav-link">Products</Nav.Link>
          </Nav>
        </Navbar.Collapse>
      </Container>
    </Navbar>
  )
}

export default AppNavbar;