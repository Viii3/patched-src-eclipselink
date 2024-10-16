/*
 * Copyright (c) 2023 Oracle and/or its affiliates. All rights reserved.
 *
 * This program and the accompanying materials are made available under the
 * terms of the Eclipse Public License v. 2.0 which is available at
 * http://www.eclipse.org/legal/epl-2.0,
 * or the Eclipse Distribution License v. 1.0 which is available at
 * http://www.eclipse.org/org/documents/edl-v10.php.
 *
 * SPDX-License-Identifier: EPL-2.0 OR BSD-3-Clause
 */

// Contributors:
// Radek Felcman - 02/2019 - Initial implementation
package org.eclipse.persistence.testing.jaxb.schemagen.classarray;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "FirstType", namespace = "http://first.temp.com/", propOrder = {
        "firstSubElement"
})
public class FirstType {

    @XmlElement(name = "FirstSubElement", namespace = "http://first.temp.com/", required = true)
    protected String firstSubElement;

    public String getFirstSubElement() {
        return firstSubElement;
    }

    public void setFirstSubElement(String value) {
        this.firstSubElement = value;
    }

}
