# Compiler and flags
CXX = g++
CXXFLAGS = -std=c++17 -g -Wall -I. -Isrc/app/encryptDecrypt -Isrc/app/fileHandling -Isrc/app/processes

# Targets
MAIN_TARGET = encrypt_decrypt.exe
CRYPTION_TARGET = cryption.exe

# Source files
MAIN_SRC = main.cpp \
           src/app/processes/ProcessManagement.cpp \
           src/app/fileHandling/IO.cpp \
           src/app/fileHandling/ReadEnv.cpp \
           src/app/encryptDecrypt/Cryption.cpp

CRYPTION_SRC = src/app/encryptDecrypt/CryptionMain.cpp \
               src/app/encryptDecrypt/Cryption.cpp \
               src/app/fileHandling/IO.cpp \
               src/app/fileHandling/ReadEnv.cpp

# Object files
MAIN_OBJ = $(MAIN_SRC:.cpp=.o)
CRYPTION_OBJ = $(CRYPTION_SRC:.cpp=.o)

# Default target to build both executables
all: $(MAIN_TARGET) $(CRYPTION_TARGET)

# Linking for the main executable
$(MAIN_TARGET): $(MAIN_OBJ)
	@echo "Linking $(MAIN_TARGET)..."
	$(CXX) $(CXXFLAGS) $^ -o $@

# Linking for the cryption executable
$(CRYPTION_TARGET): $(CRYPTION_OBJ)
	@echo "Linking $(CRYPTION_TARGET)..."
	$(CXX) $(CXXFLAGS) $^ -o $@

# Rule to compile all .cpp files to .o files
%.o: %.cpp
	@echo "Compiling $<..."
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Clean target for removing object files and executables
# Clean target for removing object files and executables
clean:
	@echo "Cleaning up object files and executables..."
	del /Q "main.o" \
	        "src\\app\\processes\\ProcessManagement.o" \
	        "src\\app\\fileHandling\\IO.o" \
	        "src\\app\\fileHandling\\ReadEnv.o" \
	        "src\\app\\encryptDecrypt\\Cryption.o" \
	        "src\\app\\encryptDecrypt\\CryptionMain.o" \
	        "encrypt_decrypt.exe" \
	        "cryption.exe"


.PHONY: clean all


