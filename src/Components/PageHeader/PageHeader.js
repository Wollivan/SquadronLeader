import React from "react";
import "./PageHeader.scss";
import Logo from "../../assets/images/aeronauts-logo.png";

export default function PageHeader() {
  return (
    <div className="header">
      <img className="header__logo" src={Logo} alt="logo" />
    </div>
  );
}
