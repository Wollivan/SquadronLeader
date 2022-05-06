import React from "react";
import "./PageFooter.scss";

export default function PageFooter() {
  return (
    <div className="footer">
      <p>A game by Tim Smith</p>
      <p>
        Please feel free to make a pull request on{" "}
        <a
          href="https://github.com/Wollivan/SquadronLeader"
          target="_blank"
          rel="noreferrer"
          className="footer__link"
        >
          GitHub
        </a>{" "}
        the if you have any ideas!
      </p>
      <p>
        If you don't have GitHub but have a suggestion please send an email to{" "}
        <a href="mailto:squadronleadergame@gmail.com" className="footer__link">
          squadronleadergame@gmail.com
        </a>
      </p>
    </div>
  );
}
