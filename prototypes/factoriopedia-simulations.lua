local wood_logistics_simulations = {}

wood_logistics_simulations.factoriopedia_wood_cargo_wagon =
{
  init =
  [[
    game.simulation.camera_position = {1, 0.5}
    game.surfaces[1].create_entities_from_blueprint_string
    {
      string = "0eNqN011ugzAMAOC7+DlUQIEWrjJNKAWPWgtOlaTtqoq7z0D3I3WT8hTF2F8SEt/hYM54csQBmjtQZ9lD83IHTwNrM8dYjwgNOE0GJgXEPX5Ak02vCpADBcK1YpncWj6PB3SSoL4qfZDa4RiShVBwsl6qLM+4SEmp4CZDJnhPDrv1WzGpJzOPNrfR5jbazKLN4tu8WtsnnXaDTa56kPwnNtuk2yz/9Q+Q9cFga+xAPlDn2+uRZD7aC/EAzZs2HhVYR7KoXqF0MwPEFwlZJxCfjfljX2XsWeOPWsWS8TeyiyXjH84+ltz9Q8pj98F27600CK/hR5/M0UcGBRxliZ+OUnBB5xeirPK6qOuyqPN9VaTT9AmuWikk",
      position = {0, 0}
    }
  ]]
}

return wood_logistics_simulations
