<?php
// capture.php - Receives and saves Base64 images

if (isset($_POST['image'])) {
    $img = $_POST['image'];
    $img = str_replace('data:image/png;base64,', '', $img);
    $img = str_replace(' ', '+', $img);
    $data = base64_decode($img);

    // ফাইলের নাম হিসেবে টাইমস্ট্যাম্প ব্যবহার
    $file = 'logs/img_' . date("Ymd_His") . '.png';

    if (file_put_contents($file, $data)) {
        echo "Successfully saved to $file";
    } else {
        echo "Error: Could not save file.";
    }
} else {
    echo "No image data received.";
}
?>

