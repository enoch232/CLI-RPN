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
          this.setState({...state, history: this.state.history.concat(result.result)})
          this.scrollToBottom()
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
            <div ref={(el) => {this.messagesEnd = el}} style={ {float:"left", clear: "both"} }></div>
            <span className = "console-carrot">> </span><input className = "console-input" value = {this.state.expression} onChange = {(e)=> this.setState({expression: e.target.value})} onKeyPress = {this._handleKeyPress.bind(this)}/>
          </div>
        </div>
      </div>
    )
  }
}
