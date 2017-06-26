class Homescreen extends React.Component {
  constructor(props){
    super(props)
  }
  componentDidMount(){
    // TODO: make API calls here to evaluate expression, and modify the state from here.
  }
  render(){
    return (
      <div className = "container">
        <div className = "title-container">
          CLI RPN Calculator
        </div>
        <div className = "console-container">
          <div className = "tab">
            <div className = "exit-button">
            </div>
            <div className = "minimize-button">
            </div>
            <div className = "maximize-button">
            </div>
          </div>
          <div className = "console">
            <input></input>
          </div>
        </div>
      </div>
    )
  }
}
