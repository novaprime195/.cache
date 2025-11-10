JAVAC=javac
JAVA=java
SRC_DIR=src/main/java
OUT_DIR=out

all:
	mkdir -p $(OUT_DIR)
	find $(SRC_DIR) -name "*.java" > sources.txt
	$(JAVAC) -d $(OUT_DIR) @sources.txt
	rm sources.txt

run:
	$(JAVA) -cp $(OUT_DIR) ui.Main

clean:
	rm -rf $(OUT_DIR)
