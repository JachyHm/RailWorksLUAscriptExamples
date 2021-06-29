#include <windows.h>
#include <stdio.h>
#include <stdlib.h>
#include <curl/curl.h>
//#include <7zip/7zip.h>
#include <iterator>
#include <fstream>
#include <string>
#include <iostream>
#include <filesystem>
namespace fs = std::filesystem;

#ifdef __cplusplus
extern "C" {
#endif
    int version_web = 0;
    int version_local = 0;
    char c_tempfile[1024];
    BOOL isVersionFile = FALSE;

    SIZE_T write_data(void* ptr, SIZE_T size, SIZE_T nmemb, FILE* stream) {
        if (isVersionFile) {
            version_web = atoi((char*)ptr);
            isVersionFile = FALSE;
        }
        return 1;
    }

    int getRemoteVersion(const char* url) {
        CURL* curl;
        CURLcode res;
        curl = curl_easy_init();
        if (curl) {
            curl_easy_setopt(curl, CURLOPT_URL, url);
            curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, write_data);
            version_web = 0;
            res = curl_easy_perform(curl);
            //always cleanup
            curl_easy_cleanup(curl);
        }
        return 0;
    }

    int downloadFile(const char* url, const char* outfilename) {
        CURL* curl;
        FILE* fp;
        CURLcode res;
        curl = curl_easy_init();
        if (curl) {
            fp = fopen(outfilename, "wb");
            curl_easy_setopt(curl, CURLOPT_URL, url);
            curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, NULL);
            curl_easy_setopt(curl, CURLOPT_WRITEDATA, fp);
            res = curl_easy_perform(curl);
            //always cleanup
            curl_easy_cleanup(curl);
            fclose(fp);
        }
        return 0;
    }

    void getCurrentVersion() {
        FILE* file;
        file = fopen("460version.txt", "r");
        if (file) {
            int c;
            while ((c = getc(file)) != EOF) {
                char _c = c;
                version_local = version_local * 10 + atoi(&_c);
            }
            fclose(file);
        }
    }

    int checkIsDirectory(const char* path) {
        struct stat s;
        return stat(path, &s) == 0 ? (s.st_mode & S_IFDIR ? 1 : 0) : 0;
    }

    void iterateOverFiles(fs::path path) {
        for (const auto& entry : fs::directory_iterator(path)) {
            const char* s_path = entry.path().string().c_str();
            if (checkIsDirectory(s_path)) {
                iterateOverFiles(entry);
                remove(s_path);
            }
            else {
                remove(s_path);
            }
        }
    }

    void installActualisation() {
        iterateOverFiles("Assets\\Smejki\\460pack01_fake");
    }

    /*void dumpToFile(const char* input)
    {
        FILE* fPtr;

        fPtr = fopen("test/test.txt", "w");

        fputs(input, fPtr);

        fclose(fPtr);
    }*/

    /*_declspec(dllexport) int checkActualisation() {
        wchar_t temppath[512] = L" ";
        int tpathlength = GetTempPath(255, temppath);

        wchar_t tempfile[1024] = L" ";
        int tfilelength = GetTempFileName(temppath, L"460", 0, tempfile);

        for (int i = 0; i < 1024; i++) {
            c_tempfile[i] = (char)tempfile[i];
        }

        isVersionFile = TRUE;
        getRemoteVersion("https://jachyhm.cz/verze460.txt");
        getCurrentVersion();

        if (version_web > version_local) {
            downloadFile("https://jachyhm.cz/460_12_01.7z", c_tempfile);
        }

        return 1;
    }*/

    _declspec(dllexport) void openDoors() {
        keybd_event(0x54, 0, 0, 0);
        keybd_event(0x54, 0, KEYEVENTF_KEYUP, 0);
    }

    /*int main() {
        checkActualisation();
        return 0;
    }*/

    BOOL WINAPI DllMain(HMODULE hModule, DWORD dwReason, LPVOID lpvReserved)
    {
        switch (dwReason) {
        case DLL_PROCESS_ATTACH:
            break;
        case DLL_PROCESS_DETACH:
            //system("notepad.exe");
            break;
        case DLL_THREAD_ATTACH:
            break;
        case DLL_THREAD_DETACH:
            break;
        }
        return TRUE;
    }
#ifdef __cplusplus
}
#endif