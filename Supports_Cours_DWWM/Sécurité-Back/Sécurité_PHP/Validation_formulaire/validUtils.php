<?php

function getValidateFilter($type)
{
    switch($type){
    case "email":
    $filter=FILTER_VALIDATE_EMAIL;
    break;
    case "int":
    $filter=FILTER_VALIDATE_INT;
    break;
    case "boolean":
    $filter=FILTER_VALIDATE_BOOLEAN;
    break;
    case "ip":
    $filter=FILTER_VALIDATE_IP;
    break;
    case "url":
    $filter=FILTER_VALIDATE_URL;
    break;
    default://important!!!
    $filter=false;//Si type est faux,la validation échoue.
    }
    return $filter;
}


function getSanitizeFilter($type)
{
    switch($type){
    case "string":
    $filter=FILTER_SANITIZE_STRING;
    break;
    case "text":
    $filter=FILTER_SANITIZE_FULL_SPECIAL_CHARS;
    break;
    case "url":
    $filter=FILTER_SANITIZE_URL;
    break;
    default://important!!!
    $filter=false;//Si type est faux,la validation échoue.
    }
    return $filter;
}
