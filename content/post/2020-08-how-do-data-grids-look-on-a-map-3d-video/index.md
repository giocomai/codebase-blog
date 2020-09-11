---
title: How do data grids look on a map? [3D video]
author: ''
date: '2020-08-14'
slug: how-do-data-grids-look-on-a-map-3d-video
categories:
  - Data notes
tags:
  - dataviz
  - maps
---

In this video, I point at some of the issues that characterise data grids and that may generate misunderstandings. 

{{< youtube cAzMzIepOC8 >}}

In the video, I mention how gridded data can be generated via satellite imagery and machine learning techniques. Of course, such data can be generated also via other means.

## References

This video is based on the data used for this article:
[Climate warming in Europe, municipality by municipality](https://www.europeandatajournalism.eu/eng/News/Data-news/Climate-warming-in-Europe-municipality-by-municipality)

Municipality-level data for Italy can be accessed through this interactive interface: [In marcia con il clima](https://datavis.europeandatajournalism.eu/obct/marciaclima/)

For more details on the methodology, check out the following notes:

- [Glocal climate change](https://medium.com/european-data-journalism-network/glocal-climate-change-2071830aa640)
- [How to find the population-weighted centre of local administrative units](https://medium.com/european-data-journalism-network/how-to-find-the-population-weighted-centre-of-local-administrative-units-a0d198fc91f7)

The dataset is an elaboration of Copernicus data. More details about the original dataset: 
[UERRA regional reanalysis for Europe on single levels from 1961 to 2019](https://cds.climate.copernicus.eu/cdsapp#!/dataset/reanalysis-uerra-europe-single-levels)

Data for administrative units are from [ISTAT](https://www.istat.it/it/archivio/222527).

The scripts used to [create this dataset from the original source is available on GitHub](https://github.com/giocomai/mescan_surfex_2m)

The scripts used to generate the files used to make the video are [also available on GitHub](https://github.com/giocomai/google_earth_studio_with_R_mescan_surfex_2m).



N.B. this video outlines some common issues related to data grids, but does not go into the specifics that are peculiar of the dataset used as an example. For more information, check out the methodological note [at the bottom of this article](https://www.europeandatajournalism.eu/eng/News/Data-news/Climate-warming-in-Europe-municipality-by-municipality) and read [the documentation that accompanies the original dataset](
https://cds.climate.copernicus.eu/cdsapp#!/dataset/reanalysis-uerra-europe-single-levels?tab=doc). Some of the issues outlined in the video are mentioned also in the original documentation: "results in complex terrain, such as mountainous regions or coastal areas, are generally less reliable than results over a more homogeneous terrain. The models cannot represent the strong gradients that sometimes are caused by the variable terrain."


