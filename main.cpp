//============================================================================
// Name        : main.cpp
// Author      : Travis Howse
// Version     : 0.1
//============================================================================

#include "socket.h"

#include <stdio.h>
#include <stdlib.h>
#include <process.h>
#include <string>
#include <time.h>

unsigned __stdcall Answer(void* a);
int initMumbleLink();
void initMumble();
void updateMumble(float distance);
float parseFreq(std::string frequency);
std::wstring ctow(const char* src);

std::wstring playerID;

struct LinkedMem {
	#ifdef WIN32
		UINT32	uiVersion;
		DWORD	uiTick;
	#else
		uint32_t uiVersion;
		uint32_t uiTick;
	#endif
		float	fAvatarPosition[3];
		float	fAvatarFront[3];
		float	fAvatarTop[3];
		wchar_t	name[256];
		float	fCameraPosition[3];
		float	fCameraFront[3];
		float	fCameraTop[3];
		wchar_t	identity[256];
	#ifdef WIN32
		UINT32	context_len;
	#else
		uint32_t context_len;
	#endif
		unsigned char context[256];
		wchar_t description[2048];
	};

LinkedMem *lm = NULL;

int main(void)
{
	puts("MumbleDCS Loaded.");
	SocketServer in(1626,5);
	updateMumble(0);
	srand(time(NULL));

	char tempPlayerID[128];
	sprintf(tempPlayerID, "%d", rand()%1000);
	//std::wstring::
	//playerID = std::wstring(tempPlayerID);
	//playerID = itoa(rand()%10000);
	playerID = ctow(tempPlayerID);
	printf("Player ID: %s\n", tempPlayerID);

	while (1) {
		Socket* s=in.Accept();
		printf("DCS Has connected.\n");

		unsigned ret;
		_beginthreadex(0,0,Answer,(void*) s,0,&ret);
	}

	return EXIT_SUCCESS;
}
std::wstring ctow(const char* src)
{
	return std::wstring(src, src + strlen(src));
}
float parseFreq(std::string frequency)
{
	char buffer[64];
	strncpy(buffer,frequency.c_str(),4);
	buffer[4] = '\0';
	if (strcmp(buffer, "2006")==0)
	{
		strncpy(buffer,frequency.c_str(),12);
		for (int i = 0; i < 7; i++)
		{
			buffer[i] = buffer[i+5];
		}
		return atof(buffer);
	}

	return 0.0f;
}

unsigned __stdcall Answer(void* a) {
	Socket* s = (Socket*) a;

  while (1) {
    //std::string r = s->ReceiveLine();
    std::string r = s->ReceiveBytes();
    //if (r.empty()) break;

    if (!r.empty())
    {
    	printf(r.c_str());
    	updateMumble(parseFreq(r)*2000);
    }
    //printf(r.c_str());
    Sleep(1);
  }
  delete s;
  printf("Socket killed!\n");

  return 0;
}

void initMumble()
{

	#ifdef WIN32
		HANDLE hMapObject = OpenFileMappingW(FILE_MAP_ALL_ACCESS, FALSE, L"MumbleLink");
		if (hMapObject == NULL)
			return;

		lm = (LinkedMem *) MapViewOfFile(hMapObject, FILE_MAP_ALL_ACCESS, 0, 0, sizeof(LinkedMem));
		if (lm == NULL) {
			CloseHandle(hMapObject);
			hMapObject = NULL;
			return;
		}
	#else
		char memname[256];
		snprintf(memname, 256, "/MumbleLink.%d", getuid());

		int shmfd = shm_open(memname, O_RDWR, S_IRUSR | S_IWUSR);

		if (shmfd < 0) {
			return;
		}

		lm = (LinkedMem *)(mmap(NULL, sizeof(struct LinkedMem), PROT_READ | PROT_WRITE, MAP_SHARED, shmfd,0));

		if (lm == (void *)(-1)) {
			lm = NULL;
			return;
		}
	#endif
}

void updateMumble(float distance) {
	printf("Distance: %f\n", distance);
	if (! lm)
		return;

	if(lm->uiVersion != 2) {
		wcsncpy(lm->name, L"MumbleDCS", 256);
		wcsncpy(lm->description, L"MumbleDCS is a Link between DCS:A-10C and Mumble.", 2048);
		lm->uiVersion = 2;
	}
	lm->uiTick++;

	// Left handed coordinate system.
	// X positive towards "left".
	// Y positive towards "up".
	// Z positive towards "into screen".
	//
	// 1 unit = 1 meter

	// Unit vector pointing out of the avatars eyes (here Front looks into scene).
	lm->fAvatarFront[0] = 0.0f;
	lm->fAvatarFront[1] = 0.0f;
	lm->fAvatarFront[2] = 1.0f;

	// Unit vector pointing out of the top of the avatars head (here Top looks straight up).
	lm->fAvatarTop[0] = 0.0f;
	lm->fAvatarTop[1] = 1.0f;
	lm->fAvatarTop[2] = 0.0f;

	// Position of the avatar (here standing slightly off the origin)
	lm->fAvatarPosition[0] = distance;
	lm->fAvatarPosition[1] = 0.0f;
	lm->fAvatarPosition[2] = 0.5f;

	// Same as avatar but for the camera.
	lm->fCameraPosition[0] = lm->fAvatarPosition[0];
	lm->fCameraPosition[1] = lm->fAvatarPosition[1];
	lm->fCameraPosition[2] = lm->fAvatarPosition[2];

	lm->fCameraFront[0] = 0.0f;
	lm->fCameraFront[1] = 0.0f;
	lm->fCameraFront[2] = 1.0f;

	lm->fCameraTop[0] = 0.0f;
	lm->fCameraTop[1] = 1.0f;
	lm->fCameraTop[2] = 0.0f;


	// Identifier which uniquely identifies a certain player in a context (e.g. the ingame Name).
	wcsncpy(lm->identity, playerID.c_str(), 256);
	// Context should be equal for players which should be able to hear each other positional and
	// differ for those who shouldn't (e.g. it could contain the server+port and team)
	memcpy(lm->context, "DCS:A-10C", 9);
	lm->context_len = 9;
}
