CXXFLAGS =	-O2 -g -Wall -fmessage-length=0

OBJS =		main.o socket.o

LIBS =		WS2_32.Lib

TARGET =	MumbleDCS.exe

$(TARGET):	$(OBJS)
	$(CXX) -o $(TARGET) $(OBJS) $(LIBS)

all:	$(TARGET)

clean:
	rm -f $(OBJS) $(TARGET)
