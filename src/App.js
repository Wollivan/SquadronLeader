import "./styles/App.scss";
import Instructions from "./Components/Instructions/Instructions";
import PageHeader from "./Components/PageHeader/PageHeader";
import PageFooter from "./Components/PageFooter/PageFooter";
import GameplayImage from "./assets/images/gameplay.jpg";
import SCADImage from "./assets/images/printing-assets.png";
import Logo from "./assets/images/aeronauts-logo.png";
import MovementImage from "./assets/images/movement-example.png";

function App() {
  return (
    <div className="App">
      <PageHeader />
      <Instructions />
      <PageFooter />
      <img
        className="hidden-image"
        src={GameplayImage}
        alt="hidden img, you shouldn't see this ever, its just for the readme"
      />
      <img
        className="hidden-image"
        src={SCADImage}
        alt="hidden img, you shouldn't see this ever, its just for the readme"
      />
      <img
        className="hidden-image"
        src={Logo}
        alt="hidden img, you shouldn't see this ever, its just for the readme"
      />
      <img
        className="hidden-image"
        src={MovementImage}
        alt="hidden img, you shouldn't see this ever, its just for the readme"
      />
    </div>
  );
}

export default App;
