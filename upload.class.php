<?php
/**
 * Created by PhpStorm.
 * User: Microcoder
 * Date: 2016/5/2
 * Time: 17:11
 */

class Upload{

    private $file;
    private $fileName;
    private $fileType;
    private $limitFileTypes;
    private $baseUploadDir;
    private $indexUploadDir;    //此次上传目录
    private $limitFileSize;   //上传文件限制大小为20M
    
    public function __construct($baseUploadDir, $limitFileTypes){
        $this->limitFileSize = 50*1024*1024; //上传文件限制大小为50M
        $this->baseUploadDir = $baseUploadDir;
        $this->limitFileTypes = $limitFileTypes;
    }

    /**
     * @return string
     */
    private function makeUploadDirByDate(){
        $dateYearMonth = date('Ym');
        $newDir = $this->baseUploadDir.'/'.$dateYearMonth;
        if(!is_dir($newDir)) {
            $this->indexUploadDir = mkdir($newDir) ? $newDir : '';
        } else {
            $this->indexUploadDir = $newDir;
        }
        return $this->indexUploadDir;
    }

    /**
     * @param $file
     */
    public function setFile($file) {
        $this->file = $file;
    }

    /**
     * Start upload
     * @return bool|string
     */
    public function start() {
        $isMkDir = $this->makeUploadDirByDate();
        if(!empty($isMkDir) && isset($this->file)) {
            $this->fileName = $this->getRandFileName($this->fileType);
            $saveFileName = $this->indexUploadDir.'/'.$this->fileName;
            if(move_uploaded_file($this->file['tmp_name'], $saveFileName)) {
                return $saveFileName;
            }
        }
        return '';
    }

    /**
     * Check file type
     * @param $tempFileName
     * @return bool
     */
    public function checkFileType($tempFileName) {
        //获取文件后缀
        $tempFileType = substr($tempFileName, strrpos($tempFileName, '.')+1);
        if(in_array($tempFileType, $this->limitFileTypes)) {
            $this->fileType = $tempFileType;
            return true;
        } else {
            return false;
        }
    }

    /**
     * Check File Size
     * @param $fileSize
     * @return bool
     */
    public function checkFileSize($fileSize) {
        return $fileSize <= $this->limitFileSize ? true : false;
    }

    /**
     * Check File is ok
     * @param $file
     * @return bool
     */
    public function check($file) {
        if($this->checkFileType($file['name']) && $this->checkFileSize($file['size'])) {
            $this->file = $file;
            return true;
        } else {
            return false;
        }
    }

    public function getRandFileName($fileType) {
        $date = date('YMDhis');
        $randKey = 'qwertyuiopasdfghjklzxcvbnm1234567890';
        $length = 6;
        $randFileName = '';
        for ($i = 0; $i<$length; $i++) {
            $randFileName = $randFileName.$randKey[rand(0,strlen($randKey)-1)];
        }
        return $randFileName.'.'.$fileType;
    }
}