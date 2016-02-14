const NewStock = React.createClass({
  getInitialState () {
  	return {name: '', price:'', quantity:'', error:false};
	},

	handleSubmit (e) {
		e.preventDefault();

		if(!this.state.name || !this.state.price || !this.state.quantity || isNaN(this.state.price) || isNaN(this.state.quantity)){
			this.setState({error:true});
		} else {
  		this.props.onStockSubmit({
					name: this.state.name,
					price: this.state.price,
					quantity: this.state.quantity
			});

			this.setState({name: '', price:'', quantity:'', error:false});
		}
	},

  handleChange (name, e) {
    var change = {};
    change[name] = e.target.value;
    this.setState(change);
	},

  render () {
    return (
      <div>
        <form onSubmit={this.handleSubmit}>
          <label >Product Name</label><br />
          <input className="form-control" value= {this.state.name} onChange={this.handleChange.bind(this, 'name')} />
          <label >Price</label><br />
          <input className="form-control" value= {this.state.price} onChange={this.handleChange.bind(this, 'price')} />
          <label >Quantity</label><br />
          <input className="form-control" value= {this.state.quantity} onChange={this.handleChange.bind(this, 'quantity')} />
          <button className="btn">Add New Stock</button>
      	</form>

      	<Error containsError={this.state.error}/>
      </div>
    );
  }
})