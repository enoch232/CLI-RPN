class Homescreen extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      expression: "",
      expressionType: "RPN",
      history: []
    }
  }

  _handleKeyPress(e){
    if (e.key == "Enter"){
      fetch(
        '/evaluate',
        {
          method: 'POST',
    			headers: {
    			  'Accept':"application/json",
    			  'Content-Type': 'application/json',
    			},
          body: JSON.stringify({
            expression: this.state.expression,
            expression_type: this.state.expressionType
          })
        }
      ).then((response) =>
        response.json()
      ).then((responseJson) => {
        if (responseJson.result){
          this.setState({expression: ""})
          this.setState({...this.state, history: this.state.history.concat(responseJson.result)})
          this._scrollToBottom()
        } else if (responseJson.error){
          alert(responseJson.message)
        } else {
          alert("Something went wrong!")
        }
      }).catch((error)=>{
        console.log(error)
      })

    }
  }

  _scrollToBottom() {
    let node = ReactDOM.findDOMNode(this.consoleEnd)
    node.scrollIntoView({block: "end", behavior: "smooth"})
  }

  render(){
    return (
      <div className = "calculator-container">
        <div className = "title-container">
          CLI Calculator
        </div>
        <select value = {this.state.expressionType} className = "expression-type-select-box" onChange = {(e)=> this.setState({expressionType: e.target.value})}>
          <option value = "RPN">RPN mode</option>
        </select>
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
            {this.state.history.map((result, index)=>{
              if (index == this.state.history.length - 1){
                return (<div key = {index} className = "lastResult">
                  {result}
                </div>)
              } else {
                return (<div key = {index} className = "result">
                  {result}
                </div>)
              }
            })}
            <div ref={(el) => {this.consoleEnd = el}} className = "console-input-point">
              <span className = "console-carrot">> </span>
              <input className = "console-input" value = {this.state.expression} onChange = {(e)=> this.setState({expression: e.target.value})} onKeyPress = {this._handleKeyPress.bind(this)}>
              </input>
            </div>
          </div>
        </div>
      </div>
    )
  }
}
