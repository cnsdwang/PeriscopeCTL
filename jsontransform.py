import json

with open('CA.geojson') as f:
    data = json.load(f)

df_output = pd.DataFrame({'province': [],  'coordinates': []})

for feature in data['features']:
    two = pd.DataFrame({'province': [feature['properties']['PRENAME']], 'coordinates': [feature['geometry']]})
    df_output = pd.concat([two, df_output])

df_output.reset_index(inplace = True)

df_output['coordinates'] = df_output['coordinates'].to_json()

df_output[['coordinates', 'province']].head()
