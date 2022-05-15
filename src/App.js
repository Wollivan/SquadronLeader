import "./styles/App.scss";
import Instructions from "./Components/Instructions/Instructions";
import PageHeader from "./Components/PageHeader/PageHeader";
import PageFooter from "./Components/PageFooter/PageFooter";
import { useState } from "react";

function App() {
  const [theme, setTheme] = useState("light");
  let themeStyles = {};

  if (theme === "light") {
    themeStyles = {
      color: "black",
      background: "white",
    };
  } else {
    themeStyles = {
      color: "white",
      background: "black",
    };
  }

  return (
    <div className="App" style={themeStyles}>
      <PageHeader theme={theme} setTheme={setTheme} version="v0.3.0" />
      <Instructions theme={theme} />
      <PageFooter />
    </div>
  );
}

export default App;
