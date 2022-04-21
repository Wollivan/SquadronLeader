import React from "react";
import "./Printing.scss";

export default function Printing() {
  return (
    <div className="content" id="downloads">
      <div className="printing">
        <h2>Downloads</h2>
        <ul className="printing__list">
          <li className="printing__list-item">
            <a
              className="printing__download"
              href="https://github.com/Wollivan/AeronautsPrintingAssets"
              target="_blank"
              rel="noreferrer"
            >
              Download all printing assets
            </a>
          </li>
          <li className="printing__list-item">
            <a
              className="printing__download"
              href="https://github.com/Wollivan/AeronautsPrintingAssets/tree/main/OpenSCAD"
              target="_blank"
              rel="noreferrer"
            >
              Download OpenSCAD
            </a>
          </li>
          <li className="printing__list-item">
            <a
              className="printing__download"
              href="https://github.com/Wollivan/AeronautsPrintingAssets/tree/main/STLs"
              target="_blank"
              rel="noreferrer"
            >
              Download printable STLs
            </a>
          </li>
        </ul>
        {/* <img
          className="printing__assets-img"
          src={SCADImage}
          alt="SCAD assets"
        /> */}
      </div>
    </div>
  );
}
