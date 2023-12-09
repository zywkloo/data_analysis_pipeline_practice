# Variables
DATA_DIR=data
RESULTS_DIR=results
FIGURE_DIR=results/figure
BUILD_DIR=results/_build

# Phony targets
.PHONY: all clean

# Default target
all: $(FIGURE_DIR)/isles.png $(FIGURE_DIR)/abyss.png $(FIGURE_DIR)/last.png $(FIGURE_DIR)/sierra.png
	jupyter-book build report

# Clean target
clean:
	rm -f $(RESULTS_DIR)/*.dat
	rm -f $(FIGURE_DIR)/*.png
	rm -rf $(BUILD_DIR)/*

# Word count data generation
$(RESULTS_DIR)/%.dat: $(DATA_DIR)/%.txt
	python scripts/wordcount.py --input_file=$< --output_file=$@

# Plot generation
$(FIGURE_DIR)/%.png: $(RESULTS_DIR)/%.dat
	python scripts/plotcount.py --input_file=$< --output_file=$@

