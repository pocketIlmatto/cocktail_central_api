var AllRecipes = React.createClass({
  getInitialState() {
    return { recipes: [] }
  },

  componentDidMount() {
    $.getJSON('/api/v1/recipes.json', (response) => { this.setState({ recipes: response }) });
  },

  render() {
    var recipes = this.state.recipes.map((recipe) => {
      return (
        <div key={recipe.id}>
          <h3>{recipe.name}</h3>
          <p>{recipe.created_at}</p>
        </div>
      )
    });

    return(
        <div>
          {recipes}
        </div>
    )
  }
});