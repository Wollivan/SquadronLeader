import React from "react";
import "./PageHeader.scss";
import GitHubWhite from "../../assets/images/github-white.png";
import GitHubBlack from "../../assets/images/github-black.png";
import Reddit from "../../assets/images/reddit.png";
export default function PageHeader({ theme, setTheme, version }) {
  // useEffect(() => {}, [theme]);
  function toggleTheme() {
    if (theme === "light") {
      setTheme("dark");
    } else {
      setTheme("light");
    }
  }

  function githubImg() {
    if (theme === "light") {
      return (
        <a
          href="https://github.com/Wollivan/SquadronLeader"
          target="_blank"
          rel="noreferrer"
          className="header__link"
        >
          <img
            src={GitHubBlack}
            alt="github link"
            className="header__link-logo"
          />
        </a>
      );
    } else {
      return (
        <a
          href="https://github.com/Wollivan/SquadronLeader"
          target="_blank"
          rel="noreferrer"
          className="header__link"
        >
          <img
            src={GitHubWhite}
            alt="github link"
            className="header__link-logo"
          />
        </a>
      );
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
      <span className="header__left">
        {githubImg()}
        <a
          href="https://www.reddit.com/r/SquadronLeader/"
          target="_blank"
          rel="noreferrer"
          className="header__link"
        >
          <img src={Reddit} alt="github link" className="header__link-logo" />
        </a>
        {version}
      </span>
      {button()}
    </div>
  );
}
