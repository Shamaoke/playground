
PROJECT_ROOT = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

OBJS = helloworld.o

ifeq ($(BUILD_MODE), debug)
	BUILD_DIR = _build-debug
	CXXFLAGS += -std=c++23 -g -O0
else ifeq ($(BUILD_MODE), profile)
	BUILD_DIR = _build-profile
	CXXFLAGS += -g -pg -fprofile-arcs -ftest-coverage
	LDFLAGS += -pg -fprofile-arcs -ftest-coverage
	EXTRA_CLEAN += helloworld.gcda helloworld.gcno $(PROJECT_ROOT)gmon.out
	EXTRA_CMDS = rm -rf helloworld.gcda
else ifeq ($(BUILD_MODE), release)
	BUILD_DIR = _build-release
	CXXFLAGS += -std=c++23 -O2
else
	$(error Build mode $(BUILD_MODE) not supported by this Makefile)
endif

all: helloworld

helloworld: $(OBJS)
	$(CXX) $(LDFLAGS) -o $(BUILD_DIR)/$@ $(BUILD_DIR)/$^
	$(EXTRA_CMDS)

%.o: $(PROJECT_ROOT)%.cpp | $(BUILD_DIR)
	$(CXX) -c $(CXXFLAGS) -o $(BUILD_DIR)/$@ $<

$(BUILD_DIR):
	mkdir $(BUILD_DIR)

clean:
	rm -rf $(BUILD_DIR)

