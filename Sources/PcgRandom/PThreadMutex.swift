#if os(Linux)
import Glibc
#else
import Darwin.C
#endif


class PThreadMutex : PcgRandomLocking {

    private var mutex = pthread_mutex_t()

    init() {
        let status = pthread_mutex_init(&mutex, nil)
        if status != 0 {
            fatalError("\(status)")
        }
    }

    deinit {
        pthread_mutex_destroy(&mutex)
    }

    func lock() {
        let status = pthread_mutex_lock(&mutex)
        if status != 0 {
            fatalError("\(status)")
        }
    }

    func unlock() {
        let status = pthread_mutex_unlock(&mutex)
        if status != 0 {
            fatalError("\(status)")
        }
    }
}
