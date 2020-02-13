# Sentimeter

This package provides a toolkit for the _Italian Amazon (www.amazon.it)_. The tools this package provides, so far, is giving ASIN, number of reviews, scraping reviews, analyzing sentiment of reviews using exclusive lexicon made for this package.

## Installation

```R
# first install the R package "devtools" if not installed
devtools::install_github('unimi-dse/adca2d89')
```

## Dataset

The package provides a dataset containing the lexicon for sentiment of Italian words, containing some thousands. The lexicon made exclusively for this package.

```R
# dataset documentation
?sentimeter::sentilexiconit
```

## Usage

```R
# load the package
require(sentimeter)
```

### Get ASIN

The function `get_asin()` gives the _ASIN_ of every product using the web address of the product. An **Amazon Standard Identification Number** (ASIN) is a 10-character alphanumeric unique identifier assigned by Amazon.it and its partners for product identification within the Amazon organization.

__Note__: This function designed to work with Italian Amazon, so it may not work with Amazon of other countries.

### Number of Reviews

The function `number_of_reviews()` is a tool to know how many reviews are written for a specific product on amazon.it. It is much better than the number provided by Amazon, because it ignores reviews without ant title or text (only stars) that are of very low quality. The input of this function is the ASIN of the product.

```R
number_of_reviews("8845290034")
```
