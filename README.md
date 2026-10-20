# GeoSoil-Cuba: Soil Mapping and Agricultural Vegetation Analysis

A geospatial analysis project integrating soil mapping, land-cover information,
and Sentinel-2 satellite imagery to investigate soil–vegetation relationships
and agricultural vegetation dynamics in Jaruco, Mayabeque, Cuba.

## Project Overview

GeoSoil-Cuba combines GIS, remote sensing, and Python-based data analysis to
develop a reproducible workflow for soil inventory, vegetation classification,
and Normalized Difference Vegetation Index (NDVI) analysis.

The study focuses on an area in Jaruco, Mayabeque Province, Cuba, including
the surroundings of the Mampostón reservoir.

The project uses soil mapping data, land-cover information, and Sentinel-2
Level-2A imagery to explore the spatial distribution of soil and vegetation
and examine vegetation-index dynamics over selected agricultural areas.

## Objectives

- Inspect and prepare soil mapping data for spatial analysis.
- Intersect soil information with the study area's boundary.
- Integrate soil and vegetation classifications.
- Acquire and validate Sentinel-2 imagery.
- Calculate and process NDVI from the red and near-infrared bands.
- Evaluate image quality and cloud contamination.
- Analyze NDVI time series for selected agricultural areas.
- Produce reproducible tables, statistics, and maps.

## Study Area

The area of interest (AOI) covers approximately **178.47 km²** in Jaruco,
Mayabeque Province, western Cuba, including agricultural landscapes, vegetation,
and the Mampostón reservoir. The AOI was defined from a KML boundary in WGS 84
(EPSG:4326). Soil-map intersection and area calculations use NAD27 / Cuba Norte
(EPSG:3795); raster analysis also uses UTM Zone 17N (EPSG:32617).

The analysis operates at three complementary scales: the overall AOI for soil
and land-cover integration, a unified agricultural region for regional NDVI
analysis, and **three locally verified potato-field samples** digitized in QGIS
for field-level comparisons.

## Methodology

The workflow is organized into six Jupyter notebooks.

| Notebook | Description |
|---|---|
| `00_inspect_mayabeque_soil.ipynb` | Inspection of the source soil mapping data. |
| `01_aoi_soil_intersection.ipynb` | Preparation of the area of interest and soil intersections. |
| `02_soil_inventory_and_vegetation.ipynb` | Integration and analysis of soil and vegetation information. |
| `03_sentinel2_data_acquisition.ipynb` | Sentinel-2 product discovery, acquisition, and validation. |
| `04_sentinel2_ndvi_processing.ipynb` | Raster preparation and NDVI processing. |
| `05_ndvi_analysis_and_plots.ipynb` | NDVI quality screening, time-series analysis, statistics, and visualizations. |

### Soil and Vegetation Analysis

The soil workflow prepares the source mapping data, intersects it with the
study area, and combines soil attributes with vegetation and land-cover
information.

Spatial coverage gaps and missing classifications are examined separately
to distinguish incomplete data from mapped soil and vegetation classes.

### Sentinel-2 and NDVI Analysis

Sentinel-2 Level-2A imagery provides red (B04) and near-infrared (B08) bands
for NDVI calculation.

NDVI is calculated as:

**NDVI = (B08 − B04) / (B08 + B04)**

The workflow includes raster validation, cloud screening using the
Scene Classification Layer (SCL), and analysis of selected low-cloud
observations.

Time-series analysis covers the broader agricultural region and three
selected potato-field samples. Field samples provide a targeted comparison,
not a statistically representative survey of potato cultivation in Cuba.

## Selected Results

The following figures summarize results reported in the accompanying article;
consult the article and notebooks for definitions, methods, and qualifications.

| Measure | Reported result |
|---|---|
| AOI area | Approximately 178.47 km² |
| Soil-map coverage | Approximately 162.85 km² (91.25% of AOI) |
| Area outside soil-map coverage | Approximately 15.62 km² |
| Unmapped water area | Approximately 11.42 km² |
| Remaining non-water gaps | Approximately 4.20 km² (2.35% of AOI) |
| Sentinel-2 catalogue inventory | 226 observations, November 2025–June 2026 |
| Agricultural-region NDVI rasters generated | 32 |
| Acquisitions retained after regional screening | 15, with less than 10% regional cloud coverage |
| Retained observation period | 3 November 2025–16 June 2026 |
| Field-level sampling | Three potato-field polygons across 15 dates (45 field-date observations) |

The soil topology assessment also compared summed polygon areas against the
geometric union and identified approximately **0.055 km²** of overlapping
polygon area (as an area-accounting difference). Such differences matter when
aggregating mapped areas and should not be mistaken for additional land.

The accepted NDVI observations are not evenly distributed in time. The cloud
threshold reduces, but does not guarantee the absence of, cloud or shadow
contamination. NDVI patterns alone cannot establish crop yield, crop health,
or a causal relationship with soil type.

## Technologies

- Python
- Jupyter Notebook
- GeoPandas
- GDAL
- Rasterio
- NumPy
- pandas
- Matplotlib
- QGIS
- Linux (Xubuntu / Ubuntu)
- Sentinel-2 Level-2A imagery
- Conda

## Repository Structure

```text
geosoil-cuba/
├── data/
│   └── processed/
├── notebooks/
│   ├── 00_inspect_mayabeque_soil.ipynb
│   ├── 01_aoi_soil_intersection.ipynb
│   ├── 02_soil_inventory_and_vegetation.ipynb
│   ├── 03_sentinel2_data_acquisition.ipynb
│   ├── 04_sentinel2_ndvi_processing.ipynb
│   └── 05_ndvi_analysis_and_plots.ipynb
├── src/
│   └── scripts/
├── .gitignore
├── environment.yml
└── environment-linux.yml
```

The repository excludes large source datasets and generated outputs where
appropriate. Some data must be obtained separately before the notebooks
can be executed.

## Environment Setup

The project uses Conda to manage its Python environment.

On Linux, create the environment with:

```bash
conda env create -f environment-linux.yml
conda activate geosoil-cuba
```

If using the general environment specification instead, inspect
`environment.yml` and follow its configuration.

Open Jupyter Notebook or JupyterLab after activating the environment:

```bash
jupyter lab
```

Run the notebooks in numerical order because later stages depend on
datasets generated by earlier stages.

## Data Sources and Reproducibility

The workflow uses source soil mapping data, land-cover information, and
Sentinel-2 imagery.

Large source datasets and satellite imagery are not necessarily included
in this repository. Their availability, licensing, and acquisition
requirements must be checked before reproducing the complete analysis.

Refer to the notebook code and metadata for the specific input paths,
acquisition dates, processing parameters, and output files.

## Limitations

The analysis depends on the spatial coverage, classification quality,
temporal availability, and cloud conditions of the input datasets.

NDVI indicates vegetation greenness but does not independently establish
crop identity, yield, plant health, or soil quality.

Results from selected agricultural polygons should not automatically be
generalized to all agricultural land in Cuba.

## Project Status

This repository documents the GeoSoil-Cuba geospatial portfolio study and its
associated article. The six core notebooks cover soil preparation, spatial
integration, satellite acquisition, NDVI processing, and statistical analysis.
Methods and documentation may be refined as the project evolves.

## Author

**Ben Tamayo**

Full-Stack Developer | Python | GIS | Remote Sensing

- GitHub: [@ringdealer](https://github.com/ringdealer)
- LinkedIn: [Profile](https://www.linkedin.com/in/ringdealer/)