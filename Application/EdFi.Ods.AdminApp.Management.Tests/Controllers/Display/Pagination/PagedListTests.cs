// SPDX-License-Identifier: Apache-2.0
// Licensed to the Ed-Fi Alliance under one or more agreements.
// The Ed-Fi Alliance licenses this file to you under the Apache License, Version 2.0.
// See the LICENSE and NOTICES files in the project root for more information.

using System;
using System.Collections.Generic;
using System.Linq;
using EdFi.Ods.AdminApp.Web.Display.Pagination;
using NUnit.Framework;
using Shouldly;

namespace EdFi.Ods.AdminApp.Management.Tests.Controllers.Display.Pagination
{
    [TestFixture]
    public class PagedListTests
    {
        private static IReadOnlyList<object> ListOfObjects => new object[100];

        private static PagedList<object> FetchPagedObjects(int pageNumber) =>
            Page<object>.Fetch((offset, size) => ListOfObjects.Skip(offset).Take(size).ToList(), pageNumber);

        private static PagedList<object> FetchPagedObjects(int pageNumber, int pageSize) =>
            Page<object>.Fetch((offset, size) => ListOfObjects.Skip(offset).Take(size).ToList(), pageNumber, pageSize);

        [Test]
        public void ShouldReturnHumanPageNumber()
        {
            var pageNumber = 0;

            var pagedList = FetchPagedObjects(pageNumber);
            pagedList.PageNumber.ShouldBe(1);

            pageNumber = 1;

            pagedList = FetchPagedObjects(pageNumber);
            pagedList.PageNumber.ShouldBe(1);

            pageNumber = 15;

            pagedList = FetchPagedObjects(pageNumber);
            pagedList.PageNumber.ShouldBe(15);
        }

        [Test]
        public void ShouldCalculateOffsetCorrectlyForFirstPage()
        {
            const int pageNumber = 0;
            const int configuredPageSize = 30;

            Page<object>.Fetch((offset, size) =>
            {
                offset.ShouldBe(0);

                return ListOfObjects;
            }, pageNumber);

            Page<object>.Fetch((offset, size) =>
            {
                offset.ShouldBe(0);

                return ListOfObjects;
            }, pageNumber, configuredPageSize);
        }

        [Test]
        public void ShouldCalculateOffsetCorrectlyForNPage()
        {
            var pageNumber = 2;
            const int configuredPageSize = 25;

            Page<object>.Fetch((offset, size) =>
            {
                offset.ShouldBe(Page<object>.DefaultPageSize);

                return ListOfObjects;
            }, pageNumber);

            pageNumber = 10;

            Page<object>.Fetch((offset, size) =>
            {
                offset.ShouldBe(90);

                return ListOfObjects;
            }, pageNumber);

            Page<object>.Fetch((offset, size) =>
            {
                var calculatedOffSet = (pageNumber - 1) * configuredPageSize;

                offset.ShouldBe(calculatedOffSet);

                return ListOfObjects;
            }, pageNumber, configuredPageSize);
        }

        [Test]
        public void ShouldRequestOneAdditionalRecord()
        {
            Page<object>.Fetch((offset, size) =>
            {
                size.ShouldBe(Page<object>.DefaultPageSize + 1);

                return ListOfObjects;
            }, 0);

            const int configuredPageSize = 50;

            Page<object>.Fetch((offset, size) =>
            {
                size.ShouldBe(51);

                return ListOfObjects;
            }, 0, configuredPageSize);
        }

        [Test]
        public void ShouldDetectIfNextPageHasResults()
        {
            const int configuredPageSize = 50;
            var pageNumber = 1;

            var pagedObjects = FetchPagedObjects(pageNumber, configuredPageSize);
            pagedObjects.NextPageHasResults.ShouldBeTrue();

            pageNumber = 2;

            pagedObjects = FetchPagedObjects(pageNumber, configuredPageSize);
            pagedObjects.NextPageHasResults.ShouldBeFalse();
        }

        [Test]
        public void ShouldReturnSameAmountOfItemsAsPageSize()
        {
            const int configuredPageSize = 10;
            const int pageNumber = 1;

            var pagedObjects = FetchPagedObjects(pageNumber, configuredPageSize);

            pagedObjects.Items.Count.ShouldBe(configuredPageSize);
        }

        [Test]
        public void ShouldNotAllowPageSizeOf100()
        {
            var pageSize = 99;

            Should.NotThrow(() => FetchPagedObjects(1, pageSize));

            pageSize = 100;

            Should.Throw<ArgumentException>(() => FetchPagedObjects(1, pageSize));
        }
    }
}
