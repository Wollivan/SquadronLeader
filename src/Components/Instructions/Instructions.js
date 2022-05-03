import { React, useEffect, useState } from "react";
import Markdown from "markdown-to-jsx";
import "./Instructions.scss";
import Logo from "../../assets/images/aeronauts-logo.png";
import LogoWhite from "../../assets/images/aeronauts-logo-white.png";

export default function Instructions({ theme }) {
  const [post, setPost] = useState("");

  useEffect(() => {
    import("../../assets/markdown/README.md")
      .then((res) => {
        fetch(res.default)
          .then((res) => res.text())
          .then((res) => setPost(res))
          .catch((err) => console.log(err));
      })
      .catch((err) => console.log(err));
  });
  function outputLogo() {
    if (theme === "light") {
      return <img className="content__logo" src={Logo} alt="logo" />;
    } else {
      return <img className="content__logo" src={LogoWhite} alt="logo" />;
    }
  }
  return (
    <div className="content">
      {outputLogo()}
      <div className="rules">
        <Markdown>{post}</Markdown>
      </div>
      {/* <img className="printing__assets-img" src={SCADImage} alt="SCAD assets" /> */}
    </div>
  );
}
