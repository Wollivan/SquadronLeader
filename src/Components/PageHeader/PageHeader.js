import React from "react";
import "./PageHeader.scss";

export default function PageHeader({ theme, setTheme, version }) {
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
        className="button header__theme-btn"
        onClick={toggleTheme}
        style={btnStyles}
      >
        {btnText}
      </button>
    );
  }

  return (
    <div className="header">
      <span>{version}</span>
      {button()}
    </div>
  );
}
