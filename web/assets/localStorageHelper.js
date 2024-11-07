function saveToLocalStorage(key, value) {
    try {
        localStorage.setItem(key, value);
        console.log('Dữ liệu đã được lưu: ' + key + ' = ' + value);
    } catch (error) {
        console.error('Lỗi khi lưu dữ liệu vào localStorage: ', error);
    }
}

// Lấy dữ liệu từ localStorage
function getFromLocalStorage(key) {
    try {
        const value = localStorage.getItem(key);
        if (value === null) {
            console.log('Không tìm thấy dữ liệu cho key: ' + key);
            return null;
        } else {
            console.log('Dữ liệu đã lấy: ' + key + ' = ' + value);
            return value;
        }
    } catch (error) {
        console.error('Lỗi khi lấy dữ liệu từ localStorage: ', error);
        return null;
    }
}

// Xóa dữ liệu khỏi localStorage
function removeFromLocalStorage(key) {
    try {
        localStorage.removeItem(key);
        console.log('Dữ liệu đã được xóa: ' + key);
    } catch (error) {
        console.error('Lỗi khi xóa dữ liệu khỏi localStorage: ', error);
    }
}

// Xóa tất cả dữ liệu trong localStorage
function clearLocalStorage() {
    try {
        localStorage.clear();
        console.log('Đã xóa tất cả dữ liệu trong localStorage');
    } catch (error) {
        console.error('Lỗi khi xóa toàn bộ dữ liệu khỏi localStorage: ', error);
    }
}