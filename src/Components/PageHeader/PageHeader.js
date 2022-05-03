import React from "react";
import "./PageHeader.scss";
import Logo from "../../assets/images/aeronauts-logo.png";
import LogoWhite from "../../assets/images/aeronauts-logo-white.png";

export default function PageHeader({ theme, setTheme }) {
  // useEffect(() => {}, [theme]);
  function toggleTheme() {
    if (theme === "light") {
      setTheme("dark");
    } else {
      setTheme("light");
    }
  }

  function button() {
    let btnStyles = {};
    let btnText = "";
    if (theme === "light") {
      btnStyles = {
        color: "white",
        background: "black",
      };
      btnText = "Dark Theme";
    } else {
      btnStyles = {
        color: "black",
        background: "white",
      };
      btnText = "Light Theme";
    }
    return (
      <button
        className="button header__top--theme-btn"
        onClick={toggleTheme}
        style={btnStyles}
      >
        {btnText}
      </button>
    );
  }

  function outputLogo() {
    if (theme === "light") {
      return <img className="header__logo" src={Logo} alt="logo" />;
    } else {
      return <img className="header__logo" src={LogoWhite} alt="logo" />;
    }
  }
  return (
    <div className="header">
      <div className="header__top">
        <span>v0.2.6</span>
        {button()}
      </div>
      <div className="header__bottom">{outputLogo()}</div>
    </div>
  );
}
